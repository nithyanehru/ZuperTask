//
//  ServicesListView.swift
//  ZuperTask
//
//  Created by Nithya Nehru on 10/05/26.
//

import SwiftUI
import MapKit
import Combine
import Foundation

struct ServicesListView: View {
    @StateObject private var viewModel = ServiceViewModel()
    @State private var selectedService: Service?
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Centered Title
                Text("Services")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.vertical, 12)
                
                // Search Bar at Top
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search", text: $viewModel.searchText)
                        .font(.system(size: 16, weight: .regular)) // Match Figma font style
                        .foregroundColor(.primary)
                        .textFieldStyle(.plain)
                    Spacer()
                    
                    if !viewModel.searchText.isEmpty {
                        Button(action: { viewModel.searchText = "" }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                        }
                        .padding(.trailing, 8)
                    }
                    Image(systemName: "mic")
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                )
                .padding(.vertical)
                .padding(.horizontal)
                Spacer()
                Divider()
                    .padding(.leading, 0)
                Spacer()
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(viewModel.filteredServices) { service in
                            NavigationLink(destination: ServiceDetailView(service: service)) {
                                ServiceRowView(service: service)
                            }

                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 10)
                .scrollContentBackground(.hidden)
                
                .navigationDestination(for: Service.self) { service in
                        ServiceDetailView(service: service)
                    }
                .refreshable {
                    await viewModel.refresh()
                }
            }
        }
    }
}


