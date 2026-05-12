//
//  ServiceRepository.swift
//  ZuperTask
//
//  Created by Nithya Nehru on 11/05/26.
//

import Foundation
import Combine

final class ServiceRepository {
    func loadServices() -> AnyPublisher<[Service], Error> {
        guard let url = Bundle.main.url(forResource: "services", withExtension: "json") else {
            return Fail(error: URLError(.fileDoesNotExist)).eraseToAnyPublisher()
        }
        
        return Just(url)
            .tryMap { try Data(contentsOf: $0) }
            .decode(type: [Service].self, decoder: {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                return decoder
            }())
            .eraseToAnyPublisher()
    }
}
