//
//  ServiceDetailView.swift
//  ZuperTask
//
//  Created by Nithya Nehru on 10/05/26.
//

import Foundation
import SwiftUI
import MapKit

struct ServiceDetailView: View {
    let service: Service
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 47.6062, longitude: -122.3321),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    var body: some View {
        Divider()
            .padding(.leading, 0)
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Map(coordinateRegion: $region, annotationItems: [service]) { _ in
                    MapMarker(coordinate: region.center)
                }
                .frame(height: 200)
                .cornerRadius(12)
                .padding(.leading, 10)
                .padding(.trailing, 10)
                
                HStack(alignment: .top, spacing: 8) {
                    Text(service.title)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.primary)
                    Spacer()
                    StatusBadge(status: service.status)
                }
                .padding(.leading, 15)
                .padding(.trailing, 10)
                InfoRowView(iconName: "person.circle", title: "Customer", value: service.customerName)
                InfoRowView(iconName: "doc.text", title: "Description", value: service.description)
                InfoRowView(iconName: "clock", title: "Scheduled Time", value: service.scheduledDate.formattedString())
                InfoRowView(iconName: "mappin.and.ellipse", title: "Location", value: service.location)
                InfoRowView(iconName: "bubble.right", title: "Service Notes", value: service.notes)
            }
        }
        .foregroundColor(Color.red)
        .navigationTitle(service.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct InfoRowView: View {
    let iconName: String
    let title: String
    let value: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: iconName)
                .foregroundColor(.blue)
                .padding(.top, 5)
                .frame(width: 14, height: 14)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.primary)
                Text(value)
                    .font(.system(size: 14))
                    .foregroundColor(Color.black.opacity(0.8))
            }
        }
        .padding(.leading, 15)
        .padding(.trailing, 10)
    }
}

