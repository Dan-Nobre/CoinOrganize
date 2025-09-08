//
//  CoinOrganizeApp.swift
//  CoinOrganize
//
//  Created by Daniel Nobre on 30/08/25.
//

import SwiftUI
import SwiftData

@main
struct CoinOrganizeApp: App {
    var body: some Scene {
        WindowGroup {
            TabCustomView()
        }
        .modelContainer(for: Expense.self)
    }
}
