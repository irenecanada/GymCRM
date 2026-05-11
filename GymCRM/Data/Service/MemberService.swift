//
//  MemberService.swift
//  GymCRM
//
//  Created by Irene Canada Gomez on 5/6/26.
//

import Foundation
import Observation

@Observable
class MemberService {
    var members: [GymMember] = []
    private let userDefaults = UserDefaults.standard

    init() {
        restoreMembers()
    }

    func addMember(name: String, email: String, phone: String, type: MembershipType, isActive: Bool, createdAt: Date, paymentStatus: Bool) {
        let newMember = GymMember(
            fullName: name,
            email: email,
            phone: phone,
            membershipType: type,
            paymentStatus: paymentStatus,
            isActive: isActive,
            createdAt: createdAt,
        )
        members.append(newMember)
        saveMembers()
    }

    private func saveMembers() {
        if let data = try? JSONEncoder().encode(members) {
            userDefaults.set(data, forKey: "gym")
        }
    }

    private func restoreMembers() {
        if let data = userDefaults.data(forKey: "gym"),
           let decoded = try? JSONDecoder().decode([GymMember].self, from: data) {
            members = decoded
        }
    }

    func deleteMember(member: GymMember) {
        members.removeAll(where: { $0.id == member.id })
        saveMembers()
    }

    func deleteMembers() {
        members.removeAll()
        userDefaults.removeObject(forKey: "gym")
    }
}
