//
//  AddMemberView.swift
//  GymCRM
//
//  Created by Irene Canada Gomez on 5/7/26.
//

import SwiftUI

struct AddMemberView: View {
    @Environment(MemberService.self) var service
    @Environment(\.dismiss) var dismiss

    @State private var name = ""
    @State private var email = ""
    @State private var phone = ""
    @State private var type: MembershipType = .monthly
    @State private var isActive = true
    @State private var isPaid = true
    @State private var registrationDate = Date()

    var body: some View {
        NavigationStack {
            Form {
                TextField("Nombre Completo", text: $name)
                TextField("Email", text: $email)
                TextField("Teléfono", text: $phone)
                Picker("Tipo de Plan", selection: $type) {
                    Text("Mensual").tag(MembershipType.monthly)
                    Text("Anual").tag(MembershipType.annually)
                }



                DatePicker("Fecha de Inicio", selection: $registrationDate)
                Button {
                    isActive.toggle()
                } label: {
                    HStack {
                        Text("Estado:")
                        Spacer()
                        Text(isActive ? "ACTIVO" : "INACTIVO")
                            .bold()
                        Image(systemName: isActive ? "checkmark.circle.fill" : "xmark.circle")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(isActive ? .green : .gray)
                    .cornerRadius(10)
                }

                Button {
                    isPaid.toggle()
                } label: {
                    HStack {
                        Text("Pago:")
                        Spacer()
                        Text(isPaid ? "COMPLETADO" : "PENDIENTE")
                            .bold()
                        Image(systemName: isPaid ? "checkmark.circle.fill" : "xmark.circle")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(isPaid ? .green : .gray)
                    .cornerRadius(10)
                }
            }
            .navigationTitle("Nuevo Miembro")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Guardar") {
                        service.addMember(name: name, email: email, phone: phone, type: type, isActive: isActive, createdAt: registrationDate, isPaid: isPaid)
                        dismiss()
                    }
                }
            }
        }
    }
}
