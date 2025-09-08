//
//  ContentView.swift
//  CoinOrganize
//
//  Created by Daniel Nobre on 30/08/25.
//

import SwiftUI
import SwiftData

struct ExpansesView: View {
    @Environment(\.modelContext) private var context
    @StateObject private var viewModel: ExpensesViewModel
    
    
    ///Create a ModelContainer with your entities, get the ModelContext from the container:
    init() {
        let container = try! ModelContainer(for: Expense.self)
        let context = container.mainContext
        _viewModel = StateObject(wrappedValue: ExpensesViewModel(context: context))
    }

    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.expenses.isEmpty {
                    Text("Nenhum gasto registrado ainda")
                        .foregroundStyle(.secondary)
                        .padding()
                } else {
                    VStack {
                        Text("Expanses")
                            .font(.headline)
                        List {
                            ForEach(viewModel.expenses) { expense in
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
                    viewModel.showingSheet = true
                } label: {
                    Label("Adicionar", systemImage: "plus.circle.fill")
                }
            }
            }
            .sheet(isPresented: $viewModel.showingSheet) {
                AddExpensesSheet { newExpense in
                    viewModel.addExpense(newExpense)
                }
            }
        }
    }
}

#Preview {
    ExpansesView()
        .modelContainer(for: Expense.self, inMemory: true)
}
