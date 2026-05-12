//
//  ServicePriorityView.swift
//  ZuperTask
//
//  Created by Nithya Nehru on 11/05/26.
//

import Foundation
import SwiftUI

enum ServicePriority: String, Codable, CaseIterable, Identifiable {
    case high = "High"
    case medium = "Medium"
    case low = "Low"
    
    var id: String { rawValue }
        
    var displayName: String {
        rawValue.capitalized
    }
}

struct ServicePriorityView: View {
    let service: Service
    let servicePriority: ServicePriority
    
    var body: some View {
        HStack() {
            Text(service.title)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.primary)
                .padding(.leading, 10)
                .padding(.top, 10)
            Spacer()
            Circle()
                .foregroundColor(foregroundColorFill)
                .frame(width: 8, height: 8)
                .padding(.top, 10)
        }
        .padding(.trailing, 20)
        .padding(.bottom, 10)
    }
    
    private var foregroundColorFill: Color {
        switch servicePriority {
        case .high:
            return Color(red: 0/255, green: 128/255, blue: 0/255)  //green
        case .medium:
            return Color(red: 115/255, green: 130/255, blue: 0/255) // mint
        default:
            return Color(red: 0/255, green: 0/255, blue: 255/255) //blue
        }
    }
}
