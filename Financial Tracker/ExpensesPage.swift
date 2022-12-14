//
//  ExpensesPage.swift
//  Financial Tracker
//
//  Created by Siam Rahman on 2022-12-01.
//

import SwiftUI

struct ExpenseListView: View {
    @ObservedObject var expenseListVM = ExpenseListViewModel()
    let expenses = testDataExpense
    
    @State var showAddNewExpense = false
    
    var body: some View {
        NavigationView{
            VStack(){
                List{
                    ForEach(expenseListVM.expenseCellViewModel) {expenseCellVM in
                        ExpenseCell(expenseCellVM: expenseCellVM)
                    }
                    if showAddNewExpense{
                        ExpenseCell(expenseCellVM: ExpenseCellViewModel(expense: Expense(id: "", title: "", expenseBudget: "", expenseAmount: "", selected: false))){ expense in
                            self.expenseListVM.addExpense(expense: expense)
                            self.showAddNewExpense.toggle()
                        }
                    }
                }
                Button(action: {self.showAddNewExpense.toggle()}){
                    VStack{
                        HStack{
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                            Text("Add New expense")
                        }
                    }
                }
                .padding()
            }
            .navigationBarTitle("expense List")
        }
    }
}

struct ExpenseCell: View {
    @ObservedObject var expenseCellVM: ExpenseCellViewModel
    @State var remainingBudget = ""
    
    var onCommit: (Expense) -> (Void) = { _ in }
    
    var body: some View {
        VStack{
            Image(systemName: expenseCellVM.expense.selected ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 20, height: 20)
                .onTapGesture {
                    self.expenseCellVM.expense.selected.toggle()
                }
            
            TextField("Expense", text: $expenseCellVM.expense.title, onCommit: {
                    self.onCommit(self.expenseCellVM.expense)
                })
                .padding(.all)
                .padding(.leading)
                .padding(.trailing)
                .font(.system(size: 13))
                .frame(width: 150, alignment: .leading)
                .fixedSize(horizontal: true, vertical: false)
            
            TextField("Budget", text: $expenseCellVM.expense.expenseBudget, onCommit: {
                    self.onCommit(self.expenseCellVM.expense)
                })
                .padding(.all)
                .padding(.leading)
                .padding(.trailing)
                .font(.system(size: 15))
                .frame(width: 150, alignment: .trailing)
                .fixedSize(horizontal: false, vertical: true)
            
            TextField("Amount", text: $expenseCellVM.expense.expenseAmount, onCommit: {
                    self.onCommit(self.expenseCellVM.expense)
                })
                .padding(.all)
                .padding(.leading)
                .padding(.trailing)
                .font(.system(size: 15))
                .frame(width: 150, alignment: .trailing)
                .fixedSize(horizontal: false, vertical: true)
            
        }
        
//        Text("$" + "\($expenseCellVM.expense.expenseBudget) - \(remainingBudget)" + " Left")
//            .padding(.all)
//            .padding(.leading)
//            .padding(.trailing)
//            .font(.system(size: 15))
//            .frame(width: 150, alignment: .trailing)
//            .fixedSize(horizontal: false, vertical: true)
    }
}

struct ExpensesPage_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseListView()
    }
}
