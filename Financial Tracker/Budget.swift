//
//  Budget.swift
//  Financial Tracker
//
//  Created by Siam Rahman on 2022-12-05.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Budget: Codable, Identifiable{
    @DocumentID var id: String?
    var title: String
    var amount: String
    var selected: Bool
    // allows for items to be appended to the end of the list
    @ServerTimestamp var createdTime: Timestamp?
    var userId: String?
}

#if DEBUG
let testDataBudget = [
    Budget(title: "Groceries", amount: "$500.00", selected: true),
    Budget(title: "Transportaion", amount: "$200.00", selected: false),
    Budget(title: "Rent", amount: "$2000.00", selected: false),
    Budget(title: "Luxuries", amount: "$1000.00", selected: false),
    Budget(title: "Savings / Investing", amount: "$1000.00", selected: false)
]
#endif
