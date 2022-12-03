//
//  ContentView.swift
//  Financial Tracker
//
//  Created by Siam Rahman on 2022-11-18.
//

import SwiftUI
import Firebase

struct Login : View{
    // change view state
    @State var showingMainPageView = false

    @State var email = ""
    @State var password = ""
    @State var userIsLoggedIn = false
    @State var visible = false
//
    var body: some View{
        testPage
    }
    
    var testPage: some View{
        ZStack{
            NavigationView{
                VStack{
                    NavigationLink(destination: LoginPage()){
                        Text("Already have an account? Login")
                            .padding(.all)
                            .border(Color(UIColor.separator))
                            .padding(.leading)
                            .padding(.trailing)
                    }
                    NavigationLink(destination: SignupPage()){
                        Text("New? Signup!")
                            .padding(.all)
                            .border(Color(UIColor.separator))
                            .padding(.leading)
                            .padding(.trailing)
                    }
                }
            }
        }
    }

//    func login(){
//        Auth.auth().signIn(withEmail: email, password: password) { result, error in
//
//            if error != nil {
//                print(error!.localizedDescription)
//            }
//        }
//    }
//
//    func register(){
//        Auth.auth().createUser(withEmail: email, password: password){
//            result, error in
//
//            if error != nil{
//                print(error!.localizedDescription)
//            }
//        }
//    }
//
//    func verifyContent(){
//        // verify if username and password are not null
//    }
//
//    func signout(){
//        userIsLoggedIn.toggle()
//    }
}

struct Home : View{
    @State var show = false
    @State var showingMainPageView = false

    @State var email = ""
    @State var password = ""
    @State var userIsLoggedIn = false
    @State var visible = false
//
    var body: some View{
        testPage
    }
    
    var testPage: some View{
        ZStack{
            NavigationView{
                VStack{
                    NavigationLink(destination: LoginPage()){
                        Text("Already have an account? Login!")
                            .padding(.all)
                            .border(Color(UIColor.separator))
                            .padding(.leading)
                            .padding(.trailing)
                    }
                    NavigationLink(destination: SignupPage()){
                        Text("Don't have an account? Signup!")
                            .padding(.all)
                            .border(Color(UIColor.separator))
                            .padding(.leading)
                            .padding(.trailing)
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    var body: some View{
        // show main home page
        Home()
        
//        if userIsLoggedIn{
//            // show main home page
//        }else{
//            LoginPage()
//        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
    
