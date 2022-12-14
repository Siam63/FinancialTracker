//
//  BudgetRepository.swift
//  Financial Tracker
//
//  Created by Siam Rahman on 2022-12-12.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Firebase

class BudgetRepository: ObservableObject{
    let userId = Auth.auth().currentUser?.uid
    let db = Firestore.firestore()
    let auth = Auth.auth()
    
    @Published var budgets = [Budget]()
    
    init(){
        loadData()
    }
    
    func loadData(){
        db.collection("budgets")
            .order(by: "createdTime")
            .whereField("userId", isEqualTo: userId)
            .addSnapshotListener{ (querySnapshot, error) in
            if let querySnapshot = querySnapshot{
                self.budgets = querySnapshot.documents.compactMap{ document in
                    do{
                        let x = try document.data(as: Budget.self)
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
    
    func addBudget(_ budget: Budget){
        do{
            var addedBudget = budget
            addedBudget.userId = auth.currentUser?.uid
            let _ = try db.collection("budgets").addDocument(from: addedBudget)
        }catch{
            fatalError("Unable to encode task: \(error.localizedDescription)")
        }
    }
    
    func updateBudget(_ budget: Budget){
        if let budgetID = budget.id {
            do{
                try db.collection("budgets").document(budgetID).setData(from: budget)
            }catch{
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
}
