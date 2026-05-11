//
//  NavigationViewModel.swift
//  GymCRM
//
//  Created by Irene Canada Gomez on 5/6/26.
//

import Foundation
import SwiftUI
internal import Combine

class NavigationViewModel: ObservableObject {
    @Published var selectedScreen: Screens? = .dashboard
}
