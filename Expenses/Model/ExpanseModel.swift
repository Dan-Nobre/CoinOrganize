//
//  ExpanseModel.swift
//  CoinOrganize
//
//  Created by Daniel Nobre on 01/09/25.
//

import Foundation

struct Expense: Identifiable, Codable {
    let id = UUID()
    var name: String
    var value: Decimal
}

