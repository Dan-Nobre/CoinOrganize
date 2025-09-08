//
//  AddExpensesSheet.swift
//  CoinOrganize
//
//  Created by Daniel Nobre on 01/09/25.
//

import SwiftUI

struct AddExpensesSheet: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var expenseName: String = ""
    @State private var expenseValue: Double = 0
    
    var onSave: (Expense) -> Void
    
    var body: some View {
        VStack {
            Text("Add Expenses")
                .font(.headline)
                .padding()
            Spacer()
            
            Form {
                Section {
                    TextField("Dê um nome pro seu gasto", text: $expenseName)
                } header: { Text("Nome do Gasto") }
                
                Section("Valor") {
                    TextField("0,00", value: $expenseValue, format: .currency(code: "BRL"))
                        .keyboardType(.decimalPad)
                }
            }
            
            Button {
                let newExpense = Expense(name: expenseName, value: expenseValue)
                onSave(newExpense)
                dismiss()
            } label: {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.blue)
                    .frame(height: 50)
                    .overlay(
                        Text("Salvar")
                            .font(.headline)
                            .foregroundColor(.white)
                    )
            }
            .padding()

        }
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancelar") { dismiss() }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Salvar") {
                    let newExpense = Expense(name: expenseName, value: expenseValue)
                    onSave(newExpense)
                    dismiss()
                }
                .disabled(expenseName.isEmpty || expenseValue == 0)
            }
        }
    }
}

#Preview {
    AddExpensesSheet(onSave: { _ in })
}

