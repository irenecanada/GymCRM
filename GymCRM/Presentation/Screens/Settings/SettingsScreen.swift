//
//  SettingsScreen.swift
//  GymCRM
//
//  Created by Irene Canada Gomez on 5/7/26.
//

import SwiftUI

struct SettingsScreen: View {
    @Environment(MemberService.self) var memberService
    @Environment(\.dismiss) var dismiss
    @State private var show = false



    var body: some View {
        Button(action: {
            show = true
        }) {
            VStack(alignment: .leading) {
                HStack{
                    Text("Delete all chats")
                        .font(.headline)
                        .foregroundColor(.white)
                    Image(systemName: "trash")
                        .foregroundStyle(Color.white)
                }
            }
            .font(.headline)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.red)
            .cornerRadius(15)

        }
        .buttonStyle(PlainButtonStyle())
        .alert("Delete all chats", isPresented: $show) {
            Button("Delete all") {
                memberService.deleteMembers()
            }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("This will permanently delete all your chats. This action cannot be undone.")
        }
        Spacer()
    }


}
