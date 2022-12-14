//
//  ExpenseRepository.swift
//  Financial Tracker
//
//  Created by Siam Rahman on 2022-12-14.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Firebase

class ExpenseRepository: ObservableObject{
    let userId = Auth.auth().currentUser?.uid
    let db = Firestore.firestore()
    let auth = Auth.auth()
    
    @Published var expenses = [Expense]()
    
    init(){
        loadData()
    }
    
    func loadData(){
        db.collection("expenses")
            .order(by: "createdTime")
            .whereField("userId", isEqualTo: userId)
            .addSnapshotListener{ (querySnapshot, error) in
            if let querySnapshot = querySnapshot{
                self.expenses = querySnapshot.documents.compactMap{ document in
                    do{
                        let x = try document.data(as: Expense.self)
                        return x
                    }
                    catch{
                        print(error)
                    }
                    return nil
                }
            }
        }
    }
    
    func addExpense(_ expense: Expense){
        do{
            var addedExpense = expense
            addedExpense.userId = auth.currentUser?.uid
            let _ = try db.collection("expenses").addDocument(from: addedExpense)
        }catch{
            fatalError("Unable to encode task: \(error.localizedDescription)")
        }
    }
    
    func updateExpense(_ expense: Expense){
        if let expenseID = expense.id {
            do{
                try db.collection("expenses").document(expenseID).setData(from: expense)
            }catch{
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
}
