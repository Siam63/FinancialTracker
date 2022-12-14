//
//  ExpenseCellViewModel.swift
//  Financial Tracker
//
//  Created by Siam Rahman on 2022-12-14.
//

import Foundation
import Combine

class ExpenseCellViewModel: ObservableObject, Identifiable{
    @Published var expense: Expense
    @Published var selectedStateIconName = ""
    @Published var expenseRepository = ExpenseRepository()
    
    var id = ""
    private var cancellables = Set<AnyCancellable>()
    
    init(expense: Expense){
        self.expense = expense
        
        $expense
            .map{ expense in
                expense.selected ? "checkmark.circle.fill" : "circle"
            }
            .assign(to: \.selectedStateIconName, on: self)
            .store(in: &cancellables)
        
        $expense
            .compactMap{ expense in
                expense.id
            }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
}
