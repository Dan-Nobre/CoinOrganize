//
//  ExpanseModel.swift
//  CoinOrganize
//
//  Created by Daniel Nobre on 01/09/25.
//

import Foundation
import SwiftData

@Model
final class Expense {
    var id: UUID
    var name: String
    var value: Double
    
    init(id: UUID = UUID(), name: String, value: Double) {
        self.id = id
        self.name = name
        self.value = value
    }
}

