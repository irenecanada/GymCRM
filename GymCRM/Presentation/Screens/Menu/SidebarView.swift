//
//  SidebarView.swift
//  GymCRM
//
//  Created by Irene Canada Gomez on 5/6/26.
//

import SwiftUI

struct SidebarView: View {
    @ObservedObject var viewModel: NavigationViewModel

    var body: some View {
        List(Screens.allCases, id: \.self, selection: $viewModel.selectedScreen) { screen in
            NavigationLink(value: screen) {
                Text(screen.title)
            }
        }
        .navigationTitle("Gym CRM")
    }
}
