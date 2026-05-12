//
//  GymMember.swift
//  GymCRM
//
//  Created by Irene Canada Gomez on 5/6/26.
//

import Foundation

struct GymMember: Identifiable, Codable , Equatable{
    var id = UUID()
    var fullName: String
    var email: String
    var phone: String
    var membershipType: MembershipType
    var paymentStatus: Bool
    var isActive: Bool
    var createdAt: Date

    var expirationDate: Date {
            let calendar = Calendar.current
            switch membershipType {
            case .monthly:
                return calendar.date(byAdding: .month, value: 1, to: createdAt) ?? createdAt
            case .annually:
                return calendar.date(byAdding: .year, value: 1, to: createdAt) ?? createdAt
            }
        }
}

enum MembershipType: String, Codable {
    case monthly = "Mensual"
    case annually = "Anual"
}
