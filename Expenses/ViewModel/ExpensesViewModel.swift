//
//  ExpensesViewModel.swift
//  CoinOrganize
//
//  Created by Daniel Nobre on 08/09/25.
//

import Foundation
import SwiftData

final class ExpensesViewModel: ObservableObject {
    @Published var showingSheet = false
    @Published var expenses: [Expense] = []
    
    private var context: ModelContext
    
    init(context: ModelContext){
        self.context = context
    }
    
    /// Query the database using Swiftdata
    func loadExpenses() {
        let descriptor = FetchDescriptor<Expense>()
        
        do {
            expenses = try context.fetch(descriptor)
        } catch {
            print("Error loading your expenses: \(error)")
        }
    }
    
    /// Receives an expense, adds it to the context and saves it
    func addExpense(_ expense: Expense) {
        context.insert(expense)
        saveContext()
        loadExpenses()
    }
    
    /// Deletes expense data from the bank
    func deleteExpense(_ expense: Expense) {
        context.delete(expense)
        saveContext()
        loadExpenses()
    }
    
    /// Saves your information in the bank
    func saveContext() {
        do {
            try context.save()
        } catch {
            print("Error saving the context: \(error)")
        }
    }
}
