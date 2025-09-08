//
//  ContentView.swift
//  CoinOrganize
//
//  Created by Daniel Nobre on 30/08/25.
//

import SwiftUI

struct ContentView: View {
    @State private var expenses: [Expense] = []
    @State private var showingSheet = false
    
    var body: some View {
        NavigationStack {
            VStack {
                if expenses.isEmpty {
                    Text("Nenhum gasto registrado ainda")
                        .foregroundStyle(.secondary)
                        .padding()
                } else {
                    VStack {
                        Text("Expanses")
                            .font(.headline)
                        List(expenses) { expense in
                            HStack {
                                Text(expense.name)
                                Spacer()
                                Text(expense.value, format: .currency(code: "BRL"))
                                    .bold()
                            }
                        }
                        .scrollContentBackground(.hidden)
                    }
                }
            }
            .toolbar { ToolbarItem(placement: .topBarTrailing) {
                Button {
                    showingSheet = true
                } label: {
                    Label("Adicionar", systemImage: "plus.circle.fill")
                }
            }
            }
            .sheet(isPresented: $showingSheet) {
                AddExpensesSheet { newExpense in
                    expenses.append(newExpense)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
