//
//  ServiceRowView.swift
//  ZuperTask
//
//  Created by Nithya Nehru on 10/05/26.
//

import Foundation
import SwiftUI

struct ServiceRowView: View {
    let service: Service
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            ServicePriorityView(service: service, servicePriority: service.priority)
            HStack() {
                // Image on the left
                Image(systemName: "person.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .foregroundColor(.blue)
                    .padding(.leading, 10)
                // Text on Right
                Text(service.customerName)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Color.black.opacity(0.8))
                    .padding(.trailing, 5)
            }
            HStack() {
                // Image on the left
                Image(systemName: "doc.text")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .foregroundColor(.blue)
                    .padding(.leading, 10)
                    .padding(.top, -15)
                Spacer()
                Text(service.description)
                     .font(.system(size: 14))
                     .foregroundColor(Color.black.opacity(0.8))
                     .frame(maxWidth: .infinity, alignment: .leading)
                     .padding(.trailing, 5)
                     .multilineTextAlignment(.leading)
            }
            Spacer()
            HStack() {
                StatusBadge(status: service.status)
                .padding(.leading, 10)
                Spacer()

                Text(service.scheduledDate.formattedString())
                    .font(.system(size: 14))
                    .foregroundColor(Color.black.opacity(0.7))
                    .padding(.trailing, 10)
            }
            .padding(5)
        }
        .listRowSeparator(.hidden)
        .padding(.vertical, 4)
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray, lineWidth: 0.2)
        )
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}
