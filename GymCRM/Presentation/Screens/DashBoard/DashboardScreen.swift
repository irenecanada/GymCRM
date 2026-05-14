//
//  DashboardView.swift
//  GymCRM
//
//  Created by Irene Canada Gomez on 5/7/26.
//

import SwiftUI

struct DashboardScreen: View {
    @Environment(MemberService.self) var memberService

    var body: some View {

            VStack(alignment: .leading, spacing: 20) {
                Text("Dashboard")
                    .font(.headline)
                    .foregroundColor(.secondary)
                HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Miembros Totales")
                        .font(.headline)
                        .foregroundColor(.secondary)

                    Text("\(memberService.members.count)")
                        .font(.system(size: 64, weight: .bold))
                        .foregroundColor(.primary)
                }
                .padding(30)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(20)

                VStack(alignment: .leading, spacing: 10) {
                    Text("Miembros Activos")
                        .font(.headline)
                        .foregroundColor(.secondary)

                    Text("\(memberService.members.filter(\.isActive).count)")
                        .font(.system(size: 64, weight: .bold))
                        .foregroundColor(.primary)
                }
                .padding(30)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(20)

                VStack(alignment: .leading, spacing: 10) {
                        Text("Pagos pendientes")
                            .font(.headline)
                            .foregroundColor(.secondary)

                    Text("\(memberService.pendings)")
                            .font(.system(size: 64, weight: .bold))
                            .foregroundColor(.primary)
                    }
                    .padding(30)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(20)


                    VStack(alignment: .leading, spacing: 10) {
                            Text("Expiracion cerca")
                                .font(.headline)
                                .foregroundColor(.secondary)

                        Text("\(memberService.expiration)")
                                .font(.system(size: 64, weight: .bold))
                                .foregroundColor(.primary)
                        }
                        .padding(30)
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(20)

                    Spacer()
                }
            }
            .padding()
        .navigationTitle(memberService.dashboardTitle)
        Spacer()
    }
}
