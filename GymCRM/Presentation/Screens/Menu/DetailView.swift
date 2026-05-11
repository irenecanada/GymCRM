//
//  DetailView.swift
//  GymCRM
//
//  Created by Irene Canada Gomez on 5/6/26.
//

import SwiftUI

struct DetailView: View {
    let screen: Screens?

    var body: some View {
        switch screen {
        case .dashboard:
            DashboardScreen()
        case .members:
            MemberScreen()
        case .settings:
            SettingsScreen()
        case .none:
            Text("Seleccione una")
        }
    }
}
