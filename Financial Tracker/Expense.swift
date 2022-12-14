//
//  Expense.swift
//  Financial Tracker
//
//  Created by Siam Rahman on 2022-12-14.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Expense: Codable, Identifiable{
    @DocumentID var id: String?
    var title: String
    var expenseBudget: String
    var expenseAmount: String
    var selected: Bool
    
    // allows for items to be appended to the end of the list
    @ServerTimestamp var createdTime: Timestamp?
    var userId: String?
}

#if DEBUG
let testDataExpense = [
    Expense(title: "Groceries", expenseBudget: "$500.00", expenseAmount: "$500.00", selected: true),
    Expense(title: "Transportaion", expenseBudget: "$200.00", expenseAmount: "$500.00", selected: false),
    Expense(title: "Rent", expenseBudget: "$2000.00", expenseAmount: "$500.00", selected: false),
    Expense(title: "Luxuries", expenseBudget: "$1000.00", expenseAmount: "$500.00", selected: false),
    Expense(title: "Savings / Investing", expenseBudget: "$1000.00", expenseAmount: "$500.00", selected: false)
]
#endif
