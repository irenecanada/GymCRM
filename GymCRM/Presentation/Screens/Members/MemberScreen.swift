//
//  MemberScreen.swift
//  GymCRM
//
//  Created by Irene Canada Gomez on 5/6/26.
//

import SwiftUI

struct MemberScreen: View {
    @Environment(MemberService.self) var memberService
    @State private var show = false
    @State private var viewModel = MemberViewModel()
    @State private var selectedFilter = 0

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text("Members")
                    .font(.largeTitle)
                    .bold()

                Spacer()



                Button {
                    show = true
                } label: {
                    Label("Add Member", systemImage: "plus")
                        .padding(8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                }

            }
            .searchable(text: $viewModel.searchText, prompt: "Buscar miembros ...")

            .padding()

            Picker("Filtro", selection: $selectedFilter) {
                Text("Todos").tag(0)
                Text("Activos").tag(1)
                Text("Inactivos").tag(2)
                Text("Pagados").tag(3)
                Text("No pagados").tag(4)
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            .onChange(of: selectedFilter) {
                changeButton()
            }

            Table(viewModel.filteredMembers) {
                TableColumn("Nombre") { member in
                    NavigationLink(destination: MemberDetailScreen(member: member)) {
                        Text(member.fullName)
                            .foregroundColor(.blue)
                    }
                }

                TableColumn("Email", value: \.email)

                TableColumn("Teléfono", value: \.phone)

                TableColumn("Tipo") { member in
                    Text(member.membershipType.rawValue)
                }

                TableColumn("Estado Pago") { member in
                    Image(systemName: member.paymentStatus ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .foregroundColor(member.paymentStatus ? .green : .red)
                }

                TableColumn("Expiración") { member in
                    Text(member.expirationDate, style: .date)
                }

                TableColumn("Activo") { member in
                    Image(systemName: member.isActive ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .foregroundColor(member.isActive ? .green : .red)
                }
            }
        }
        .sheet(isPresented: $show) {
            AddMemberView()
        }
        .onAppear {
            print("Member Screen")
            viewModel.update(members: memberService.members)
        }
        .onChange(of: memberService.members) {
            viewModel.update(members: memberService.members)
        }

    }

    func changeButton() {
        var list = memberService.members

        if selectedFilter == 1 {
            list = list.filter { $0.isActive }
        } else if selectedFilter == 2 {
            list = list.filter { !$0.isActive }
        }
        else if selectedFilter == 3 {
            list = list.filter { $0.paymentStatus }
        } else if selectedFilter == 4 {
            list = list.filter { !$0.paymentStatus }
        }

        viewModel.update(members: list)

        if !viewModel.searchText.isEmpty {
            viewModel.search()
        }
    }
}
