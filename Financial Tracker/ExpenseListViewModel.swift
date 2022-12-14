//
//  ExpenseListViewModel.swift
//  Financial Tracker
//
//  Created by Siam Rahman on 2022-12-14.
//

import Foundation
import Combine

class ExpenseListViewModel: ObservableObject{
    @Published var expenseRepository = ExpenseRepository()
    @Published var expenseCellViewModel = [ExpenseCellViewModel]()
    
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        expenseRepository.$expenses
            .map{ expenses in
                expenses.map{ expense in
                    ExpenseCellViewModel(expense: expense)
                }
            }
            .assign(to: \.expenseCellViewModel, on: self)
            .store(in: &cancellables)
    }
    
    func addExpense(expense: Expense){
        expenseRepository.addExpense(expense)
    }
}
