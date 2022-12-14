//
//  AddBudgetPage.swift
//  Financial Tracker
//
//  Created by Siam Rahman on 2022-12-04.
//

import SwiftUI

struct AddBudgetPage: View {
    @State var budgetName = ""
    @State var budgetValue = ""
    
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.white
                
                VStack{
                    Text("ADD A BUDGET")
                        .foregroundColor(.black)
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .offset(y: -150)

                    HStack{
                        Text("Title:")
                            .padding(.all)
                            .border(Color(UIColor.separator))
                            .padding(.leading)
                            .padding(.trailing)
                        
                        TextField("$0.00", text: $budgetName)
                            .padding(.all)
                            .border(Color(UIColor.separator))
                            .padding(.leading)
                            .padding(.trailing)
                    }
                    
                    HStack{
                        Text("Amount:")
                            .padding(.all)
                            .border(Color(UIColor.separator))
                            .padding(.leading)
                            .padding(.trailing)
                        
                        TextField("$0.00", text: $budgetValue)
                            .padding(.all)
                            .border(Color(UIColor.separator))
                            .padding(.leading)
                            .padding(.trailing)
                    }

                    Rectangle()
                        .frame(width: 350, height: 1)
                        .foregroundColor(.black)
                    
                    Button {
                        // add the budget to the list - this is going to be annoying...
                    } label: {
                        Text("+ Add")
                            .bold()
                            .frame(width: 200, height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.linearGradient(colors: [.red, .red], startPoint: .top, endPoint: .bottomTrailing))
                            ).foregroundColor(.black)
                    }
                }
            }.ignoresSafeArea()
        }

    }
}

struct AddBudgetPage_Previews: PreviewProvider {
    static var previews: some View {
        AddBudgetPage()
    }
}
