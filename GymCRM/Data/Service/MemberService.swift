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
    var member: GymMember?
    private let userDefaults = UserDefaults.standard
    var dashboardTitle: String = "GYM CRM"

    init() {
        restoreMembers()
    }

    func addMember(name: String, email: String, phone: String, type: MembershipType, isActive: Bool, createdAt: Date, isPaid: Bool) {

        let calendar = Calendar.current
        let calculatedExpiration: Date

        if type == .monthly {
            calculatedExpiration = calendar.date(byAdding: .month, value: 1, to: createdAt) ?? createdAt
        } else {
            calculatedExpiration = calendar.date(byAdding: .year, value: 1, to: createdAt) ?? createdAt
        }

        let newMember = GymMember(
            fullName: name,
            email: email,
            phone: phone,
            membershipType: type,
            isPaid: isPaid,
            isActive: isActive,
            createdAt: createdAt,
            expirationDate: calculatedExpiration 
        )
        members.append(newMember)
        saveMembers()
    }

    func updateMember(_ updatedMember: GymMember) {
        if let index = members.firstIndex(where: { $0.id == updatedMember.id }) {
            members[index] = updatedMember
            saveMembers()
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

    var pendings: Int {
        members.filter { !$0.paymentStatus }.count
    }


    

    var expiration: Int {
        let limitDate = Calendar.current.date(byAdding: .day, value: 5, to: Date()) ?? Date()

        return members.count { $0.expirationDate >= Date() && $0.expirationDate <= limitDate }
    }



}
