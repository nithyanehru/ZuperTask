//
//  Service.swift
//  ZuperTask
//
//  Created by Nithya Nehru on 11/05/26.
//

import Foundation
struct Service: Identifiable, Codable, Hashable {
    let id: UUID
    let title: String
    let customerName: String
    let description: String
    let priority: ServicePriority
    let status: ServiceStatus
    let scheduledDate: Date
    let location: String
    let notes: String
}

extension Date {
    func formattedString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy, h:mm a"
        let calendar = Calendar.current
        if calendar.isDateInToday(self) {
            return "Today, \(formatter.string(from: self).components(separatedBy: ", ")[1])"
        } else if calendar.isDateInTomorrow(self) {
            return "Tomorrow, \(formatter.string(from: self).components(separatedBy: ", ")[1])"
        } else if calendar.isDateInYesterday(self) {
            return "Yesterday, \(formatter.string(from: self).components(separatedBy: ", ")[1])"
        } else {
            return formatter.string(from: self)
        }
    }
}
