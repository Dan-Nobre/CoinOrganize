//
//  User.swift
//  CoinOrganize
//
//  Created by Daniel Nobre on 30/08/25.
//

import Foundation

struct User: Codable, Identifiable {
    var id = UUID()
    var name: String
    var wage: Double
    var wagesExtras: [Double] = []
    
    var totalIncome: Double {
        wage + wagesExtras.reduce(0, +)
    }
}
