//
//  BudgetCellViewModel.swift
//  Financial Tracker
//
//  Created by Siam Rahman on 2022-12-07.
//

import Foundation
import Combine

class BudgetCellViewModel: ObservableObject, Identifiable{
    @Published var budget: Budget
    @Published var selectedStateIconName = ""
    @Published var budgetRepository = BudgetRepository()
    
    var id = ""
    private var cancellables = Set<AnyCancellable>()
    
    init(budget: Budget){
        self.budget = budget
        
        $budget
            .map{ budget in
                budget.selected ? "checkmark.circle.fill" : "circle"
            }
            .assign(to: \.selectedStateIconName, on: self)
            .store(in: &cancellables)
        
        $budget
            .compactMap{ budget in
                budget.id
            }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
}


