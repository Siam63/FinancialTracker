//
//  MainPageHome.swift
//  Financial Tracker
//
//  Created by Siam Rahman on 2022-11-27.
//

import SwiftUI

struct MainPageHome: View {
    @State var monthlyExpenses = ""
    @State var monthlyIncome = ""
    @State var totalIncome = ""
    @State var totalExpenses = ""
    
    var body: some View {
        ZStack{
            Color.white
            
            VStack{
                Text("Financial Tracker")
                    .foregroundColor(.black)
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .offset(y: -150)
                
                TextField("Monthly Expenses", text: $monthlyExpenses)
                    .padding(.all)
                    .border(Color(UIColor.separator))
                    .padding(.leading)
                    .padding(.trailing)
                
                TextField("Monthly Income", text: $monthlyIncome)
                    .padding(.all)
                    .border(Color(UIColor.separator))
                    .padding(.leading)
                    .padding(.trailing)
                
                TextField("Total Income", text: $totalIncome)
                    .padding(.all)
                    .border(Color(UIColor.separator))
                    .padding(.leading)
                    .padding(.trailing)
                
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.black)

//                TextField("Yearly Income", text: $totalIncome)
//                    .padding(.all)
//                    .border(Color(UIColor.separator))
//                    .padding(.leading)
//                    .padding(.trailing)

                VStack{
                    Text("Total Monthly Expenses: ")
                    
                    Text("Monthly Income: ")
                    
                    Text("Yearly Income: ")
                }
                
                Button {
                    // Something
                } label: {
                    Text("+ Add Expenses")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.linearGradient(colors: [.pink, .red], startPoint: .top, endPoint: .bottomTrailing))
                        ).foregroundColor(.white)
                }
            }
        }.ignoresSafeArea()
    }
}

struct MainPageHome_Previews: PreviewProvider {
    static var previews: some View {
        MainPageHome()
    }
}
