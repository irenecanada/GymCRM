//
//  MemberDetailScreen.swift
//  GymCRM
//
//  Created by Irene Canada Gomez on 5/7/26.
//

import SwiftUI

struct MemberDetailScreen: View {
    let member: GymMember
    @Environment(MemberService.self) var memberService
    @Environment(\.dismiss) var dismiss

    var body: some View {
        List {
            Section("Información Personal") {
                HStack {
                    Text("Nombre: ")
                        .bold()
                    Text(member.fullName)
                }
                HStack {
                    Text("Email: ")
                        .bold()
                    Text(member.email)
                }
                HStack {
                    Text("Telefono: ")
                        .bold()
                    Text(member.phone)
                }
            }

            Section("Suscripcion") {
                HStack {
                    Text("Plan: ")
                        .bold()
                    Text(member.membershipType.rawValue)
                }
                HStack {
                    Text("Inicio: ")
                        .bold()
                    Text(member.createdAt.formatted(date: .complete, time: .omitted))
                }
                HStack {
                    Text("Expiracion: ")
                        .bold()
                    Text(member.expirationDate.formatted(date: .complete, time: .omitted))
                }
            }

            Section("Tipo") {
                HStack {
                    Text("Activo: ")
                        .bold()
                    Text(member.isActive ? "Sí" : "No")
                }
                HStack {
                    Text("Pago: ")
                        .bold()
                    Text(member.paymentStatus ? "Sí" : "No")
                }
            }

            Section {
                Button(role: .destructive) {
                    memberService.deleteMember(member: member)
                    dismiss()
                } label: {
                    HStack {
                        Spacer()
                        Text("Eliminar Miembro")
                        Spacer()
                    }
                }
            }
            Section {
                Button(role: .cancel) {
                    dismiss()
                } label: {
                    HStack {
                        Spacer()
                        Text("Cancelar")
                        Spacer()
                    }
                }
            }
        }
        .navigationTitle(member.fullName)
    }
}
