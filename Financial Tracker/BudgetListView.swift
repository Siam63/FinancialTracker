//
//  BudgetListView.swift
//  Financial Tracker
//
//  Created by Siam Rahman on 2022-12-05.
//

import SwiftUI

struct BudgetListView: View {
    @ObservedObject var budgetListVM = BudgetListViewModel()
    let budgets = testDataBudget
    
    @State var showAddNewBudget = false
    
    var body: some View {
        NavigationView{
            VStack(){
                List{
                    ForEach(budgetListVM.budgetCellViewModel) {budgetCellVM in
                        BudgetCell(budgetCellVM: budgetCellVM)
                    }
                    if showAddNewBudget{
                        BudgetCell(budgetCellVM: BudgetCellViewModel(budget: Budget(id: "", title: "", amount: "", selected: false))){ budget in
                            self.budgetListVM.addBudget(budget: budget)
                            self.showAddNewBudget.toggle()
                        }
                    }
                }
                Button(action: {self.showAddNewBudget.toggle()}){
                    VStack{
                        HStack{
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                            Text("Add New Budget")
                        }
                    }
                }
                .padding()
            }
            .navigationBarTitle("Budget List")
        }
    }
}

struct BudgetListView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetListView()
    }
}

struct BudgetCell: View {
    @ObservedObject var budgetCellVM: BudgetCellViewModel
    
    var onCommit: (Budget) -> (Void) = { _ in }
    
    var body: some View {
        HStack{
            Image(systemName: budgetCellVM.budget.selected ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 20, height: 20)
                .onTapGesture {
                    self.budgetCellVM.budget.selected.toggle()
                }
            
            TextField("Enter budget name: ", text: $budgetCellVM.budget.title, onCommit: {
                    self.onCommit(self.budgetCellVM.budget)
                })
                .padding(.all)
                .padding(.leading)
                .padding(.trailing)
                .font(.system(size: 13))
                .frame(width: 150, alignment: .leading)
                .fixedSize(horizontal: true, vertical: false)
            
            TextField("Enter budget amount: ", text: $budgetCellVM.budget.amount, onCommit: {
                    self.onCommit(self.budgetCellVM.budget)
                })
                .padding(.all)
                .padding(.leading)
                .padding(.trailing)
                .font(.system(size: 15))
                .frame(width: 150, alignment: .trailing)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}
