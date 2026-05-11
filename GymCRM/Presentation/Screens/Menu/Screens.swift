//
//  Screens.swift
//  GymCRM
//
//  Created by Irene Canada Gomez on 5/6/26.
//

import Foundation

enum Screens: CaseIterable {
    case dashboard
    case members
    case settings

    var title: String {
        switch self {
        case .dashboard: return "Dashboard"
        case .members: return "Members"
        case .settings: return "Settings"
        }
    }
}
