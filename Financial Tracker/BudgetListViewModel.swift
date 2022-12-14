//
//  BudgetListViewModel.swift
//  Financial Tracker
//
//  Created by Siam Rahman on 2022-12-07.
//

import Foundation
import Combine

class BudgetListViewModel: ObservableObject{
    @Published var budgetRepository = BudgetRepository()
    @Published var budgetCellViewModel = [BudgetCellViewModel]()
    
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        budgetRepository.$budgets
            .map{ budgets in
                budgets.map{ budget in
                    BudgetCellViewModel(budget: budget)
                }
            }
            .assign(to: \.budgetCellViewModel, on: self)
            .store(in: &cancellables)
    }
    
    func addBudget(budget: Budget){
        budgetRepository.addBudget(budget)
    }
}
