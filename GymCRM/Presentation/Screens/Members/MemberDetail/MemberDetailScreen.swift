//
//  MemberDetailScreen.swift
//  GymCRM
//
//  Created by Irene Canada Gomez on 5/7/26.
//

import SwiftUI

struct MemberDetailScreen: View {
    @State var member: GymMember
    @Environment(MemberService.self) var memberService
    @Environment(\.dismiss) var dismiss

    var body: some View {
        List {
            Section("Información Personal") {
                HStack {
                    Text("Nombre: ").bold()
                    TextField("Nombre", text: $member.fullName)
                }
                HStack {
                    Text("Email: ").bold()
                    TextField("Email", text: $member.email)
                }
                HStack {
                    Text("Telefono: ").bold()
                    TextField("Telefono", text: $member.phone)
                }
            }
            Section("Fechas de Membresía") {
                DatePicker("Fecha Inicio", selection: $member.createdAt, displayedComponents: .date)

                DatePicker("Fecha Expiración", selection: $member.expirationDate, displayedComponents: .date)
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
                    Text("Activo: ").bold()
                    Toggle("", isOn: $member.isActive).labelsHidden()
                }
                HStack {
                    Text("Pago: ").bold()
                    Text(member.paymentStatus ? "Sí" : "No")
                        .foregroundColor(member.paymentStatus ? .green : .red)
                }

                if !member.paymentStatus {
                    Button("Renovar 1 Mes") {
                        member.expirationDate = Calendar.current.date(byAdding: .month, value: 1, to: Date()) ?? Date()
                        member.isPaid = true
                        memberService.updateMember(member)
                    }
                    .foregroundColor(.blue)

                    Button("Renovar 1 Año") {
                        member.expirationDate = Calendar.current.date(byAdding: .year, value: 1, to: Date()) ?? Date()
                        member.isPaid = true
                        memberService.updateMember(member)
                    }
                    .foregroundColor(.orange)
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
        }
        .navigationTitle(member.fullName)
        .toolbar {
            Button("Guardar") {
                memberService.updateMember(member)
                dismiss()
            }
        }
    }
}
