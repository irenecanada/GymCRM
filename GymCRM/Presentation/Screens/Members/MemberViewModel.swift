//
//  MemberViewModel.swift
//  GymCRM
//
//  Created by Irene Canada Gomez on 5/6/26.
//

import Foundation
internal import Combine
import SwiftUI

@Observable
class MemberViewModel{
    private var members: [GymMember] = []
    var filteredMembers: [GymMember] = []
    var searchText = "" {
        didSet {
            search()
        }
    }

    func search() {
        if searchText.isEmpty {
           filteredMembers = members
        } else {
            let filtered = members.filter { $0.fullName.contains(searchText) }
            filteredMembers = filtered
        }

    }

    func update(members: [GymMember]) {
        self.members = members
        self.filteredMembers = members
    }
}
