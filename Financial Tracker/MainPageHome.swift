//
//  MainPageHome.swift
//  Financial Tracker
//
//  Created by Siam Rahman on 2022-11-27.
//

import SwiftUI
import Firebase

class PageSwitcher: ObservableObject{
    @Published var switchPage: Bool = false
}

struct MainPageHome: View {
    let auth = Auth.auth()
    
    // Class object initializations
    @StateObject var logger = LoggedIn()
    @StateObject var switcher = PageSwitcher()
    
    @State var groceryBudget = ""
    @State var rentBudget = ""
    @State var transportationBudget = ""
    @State var otherBudget = ""
    
    @State var pageSwitcher: Bool = false
    
    // add a new budget values:
    @State var newBudgetName = ""
    @State var newBudgetValue = ""
    
    @State var showingLoginPage = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.white
                
                VStack{
                    Text("Welcome")
                        .foregroundColor(.black)
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                    
                    Rectangle()
                        .frame(width: 350, height: 1)
                        .foregroundColor(.black)
                        .padding(.bottom, 25)
                    
                    Text("Welcome to your personal financial tracker. Here you can monitor your spendings and make a budget list!")
                        .foregroundColor(.black)
                        .font(.system(size: 20, design: .rounded))
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                    
                    VStack{
                        HStack{
                            NavigationLink(destination: ExpenseListView()){
                                Text("Spendings / Expenses")
                                    .padding(.all)
                                    .border(Color(UIColor.separator))
                                    .padding(.leading)
                                    .padding(.trailing)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            
                            NavigationLink(destination: BudgetListView()){
                                Text("Budgeting")
                                    .padding(.all)
                                    .border(Color(UIColor.separator))
                                    .padding(.leading)
                                    .padding(.trailing)
                            }
                        }
                    }
                    
                    NavigationLink(destination: LoginPage()){
                        Text("Signout")
                            .padding(.all)
                            .border(Color(UIColor.separator))
                            .padding(.leading)
                            .padding(.trailing)
                    }.simultaneousGesture(TapGesture().onEnded({
                        signOut()
                        showingLoginPage.toggle()
                    }))
                }
            }.ignoresSafeArea()
        }.navigationBarBackButtonHidden(true)
    }
    
    func signOut(){
        try? auth.signOut()
        logger.userLoggedIn.toggle()
    }
    
}

struct Budgeting: View{
    var body: some View{
        Text("We are on the budeting page!")
    }
}


struct MainPageHome_Previews: PreviewProvider {
    static var previews: some View {
        MainPageHome()
    }
}
