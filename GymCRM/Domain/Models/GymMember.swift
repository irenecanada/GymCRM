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
    var isPaid: Bool
    var isActive: Bool
    var createdAt: Date
    var expirationDate: Date 

    var paymentStatus: Bool {
        if Date() > expirationDate {
            return false
        }
        return isPaid
    }
}

enum MembershipType: String, Codable {
    case monthly = "Mensual"
    case annually = "Anual"
}
