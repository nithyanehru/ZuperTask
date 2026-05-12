//
//  ServiceViewModel.swift
//  ZuperTask
//
//  Created by Nithya Nehru on 11/05/26.
//

import SwiftUI
import Combine

final class ServiceViewModel: ObservableObject {
    @Published var services: [Service] = []
    @Published var filteredServices: [Service] = []
    @Published var searchText: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    private let repository = ServiceRepository()
    
    init() {
        fetchServices()
        setupSearch()
    }
    
    func fetchServices() {
        repository.loadServices()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] services in
                self?.services = services
                self?.filteredServices = services
            })
            .store(in: &cancellables)
    }
    
    func setupSearch() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .map { [unowned self] text in
                text.isEmpty ? services : services.filter {
                    $0.title.localizedCaseInsensitiveContains(text) ||
                    $0.customerName.localizedCaseInsensitiveContains(text) ||
                    $0.description.localizedCaseInsensitiveContains(text)
                }
            }
            .assign(to: &$filteredServices)
    }
    
    func refresh() async {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        fetchServices()
    }
}
