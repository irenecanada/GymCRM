//
//  ContentView.swift
//  GymCRM
//
//  Created by Irene Canada Gomez on 5/6/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = NavigationViewModel()

    var body: some View {
        NavigationSplitView {
            SidebarView(viewModel: viewModel)
        } detail: {
            DetailView(screen: viewModel.selectedScreen)
        }
    }
}
