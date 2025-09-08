//
//  ContentView.swift
//  CoinOrganize
//
//  Created by Daniel Nobre on 30/08/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query private var expenses: [Expense]
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
                        List {
                            ForEach(expenses) { expense in
                                HStack {
                                    Text(expense.name)
                                    Spacer()
                                    Text(expense.value, format: .currency(code: "BRL"))
                                        .bold()
                                }
                                .contextMenu {
                                    Button(role: .destructive) {
                                        context.delete(expense)
                                    } label: {
                                        Label("Deletar", systemImage: "trash")
                                    }
                                }
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
                    context.insert(newExpense)
                }
            }
        }
    }
    private func deleteExpense(at offsets: IndexSet) {
        for index in offsets {
            context.delete(expenses[index])
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Expense.self, inMemory: true)
}
