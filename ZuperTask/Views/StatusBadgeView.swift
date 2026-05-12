//
//  StatusBadgeView.swift
//  ZuperTask
//
//  Created by Nithya Nehru on 10/05/26.
//

import Foundation
import SwiftUI

enum ServiceStatus: String, Codable, CaseIterable, Identifiable {
    case planned = "Planned"
    case scheduled = "Scheduled"
    case confirmed = "Confirmed"
    case approved = "Approved"
    
    var id: String { rawValue }
        
    var displayName: String {
        rawValue.capitalized
    }
}

struct StatusBadge: View {
    let status: ServiceStatus
    
    var body: some View {
           HStack(spacing: 6) {
               RoundedRectangle(cornerRadius: 4)
                   .fill(squareColor)
                   .frame(width: 14, height: 14)

               Text(status.rawValue)
                   .font(.system(size: 14, weight: .regular))
                   .foregroundColor(textColor)
           }
           .padding(.horizontal, 10)
           .padding(.vertical, 6)
           .background(backgroundColor)
           .cornerRadius(16)
       }

       private var backgroundColor: Color {
           switch status {
           case .planned:
               return Color(red: 0.90, green: 0.96, blue: 1.0) // light blue
           case .scheduled:
               return Color(red: 0.93, green: 0.98, blue: 0.93) // light green
           default:
               return Color(red: 1.0, green: 0.95, blue: 0.90) // light beige
           }
       }

       private var textColor: Color {
           switch status {
           case .planned:
               return Color(red: 0.0, green: 0.45, blue: 0.80) // blue text
           case .scheduled:
               return Color(red: 0.0, green: 0.55, blue: 0.25) // green text
           default:
               return Color(red: 0.65, green: 0.35, blue: 0.10) // brown text
           }
       }

       private var squareColor: Color {
           switch status {
           case .planned:
               return Color(red: 0.70, green: 0.85, blue: 1.0) // darker blue square
           case .scheduled:
               return Color(red: 0.75, green: 0.90, blue: 0.75) // darker green square
           default:
               return Color(red: 1.0, green: 0.88, blue: 0.75) // darker beige square
           }
       }
}
