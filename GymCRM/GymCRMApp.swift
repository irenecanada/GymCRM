//
//  GymCRMApp.swift
//  GymCRM
//
//  Created by Irene Canada Gomez on 5/6/26.
//

import SwiftUI

@main
struct GymCRMApp: App {
    @State private var memberService = MemberService()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(memberService)
        }
    }
}
