//
//  ContentView.swift
//  CoinOrganize
//
//  Created by Daniel Nobre on 30/08/25.
//

import SwiftUI

struct ContentView: View {
    @State private var user = User(name: "Daniel", wage: 3000)

    var body: some View {
        VStack(spacing: 20) {
            Text("👤 \(user.name)")
                .font(.title)

            Text("💰 Salário: R$ \(user.wage, specifier: "%.2f")")
                .font(.headline)

            Text("➕ Ganhos extras: R$ \(user.wagesExtras.reduce(0, +), specifier: "%.2f")")
                .font(.subheadline)

            Text("📊 Total do mês: R$ \(user.totalIncome, specifier: "%.2f")")
                .font(.title2)
                .bold()
                .padding(.top)

            Button("Adicionar ganho extra de R$100") {
                user.wagesExtras.append(100)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}


#Preview {
    ContentView()
}
