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
    
    init(context: ModelContext) {
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
                        Text("Expenses")
                            .font(.headline)
                            .padding()
                        
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
                                        viewModel.deleteExpense(expense)
                                    } label: {
                                        Label("Deletar", systemImage: "trash")
                                    }
                                }
                            }
//                            .scrollContentBackground(.hidden)
                        }
                        .scrollContentBackground(.hidden) // remove o fundo
//                        .background(Color.clear)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
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
            .onAppear {
                viewModel.loadExpenses()
            }
        }
    }
}

//#Preview {
//    // Cria o container com a entidade Expense
//    let container = try! ModelContainer(for: Expense.self, inMemory: true)
//
//    // Passa o context do container para a view
//    ExpansesView(context: container.modelContext)
//}

