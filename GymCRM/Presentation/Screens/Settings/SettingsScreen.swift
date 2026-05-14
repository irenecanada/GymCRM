//
//  SettingsScreen.swift
//  GymCRM
//
//  Created by Irene Canada Gomez on 5/7/26.
//

import SwiftUI

struct SettingsScreen: View {
    @Environment(MemberService.self) var memberService
    @State private var show = false

    var body: some View {
        @Bindable var service = memberService
        NavigationStack {
            List {
                Section(header: Text("AJUSTES")) {

                    Button(role: .destructive) {
                        show = true
                    } label: {
                        HStack {
                            Image(systemName: "trash.fill")
                            Text("Eliminar todos los miembros")
                                .fontWeight(.semibold)
                            Spacer()
                        }
                        .padding(.vertical, 8)
                    }
                }

                Section(header: Text("EDICIÓN")) {
                    Text("Nombre de la App")
                        .fontWeight(.bold)
                    TextField("Editar título del Dashboard", text: $service.dashboardTitle)
                        .textFieldStyle(.roundedBorder)
                }
            }
            .navigationTitle("Ajustes")
            .alert("¿Borrar todos los miembros?", isPresented: $show) {
                Button("Eliminar todo", role: .destructive) {
                    memberService.deleteMembers()
                }
                Button("Cancelar", role: .cancel) { }
            } message: {
                Text("Esta acción eliminará permanentemente a todos. No se puede deshacer.")
            }


        }
    }
}
