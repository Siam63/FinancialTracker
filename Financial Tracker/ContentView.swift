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
//
    var welcomePage: some View{
        ZStack{
            Color.black

            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.pink, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 1000, height: 400)
                .rotationEffect(.degrees(135))
                .offset(y: -350)

            VStack{
                Text("Welcome")
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .offset(x: -100, y: -100)

                TextField("Email", text: $email)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: email.isEmpty){
                        Text("Email")
                            .foregroundColor(.white)
                            .bold()
                    }

                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)

                SecureField("Password", text: $password)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: password.isEmpty){
                        Text("Password")
                            .foregroundColor(.white)
                            .bold()
                    }

                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)

                Button {
//                    login()
                } label: {
                    Text("Log In")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.linearGradient(colors: [.pink, .red], startPoint: .top, endPoint: .bottomTrailing))
                        ).foregroundColor(.white)
                }
                .padding(.top)
                .offset(y: 100)

                Button {
                    register()
                } label: {
                    Text("Don't have an accont? Register")
                        .bold()
                        .foregroundColor(.blue)
                }
                .padding(.top)
                .offset(y: 100)

            }
            .frame(width: 350)
            .onAppear{
                Auth.auth().addStateDidChangeListener{auth, user in

                    if user != nil{
                        // once logged in, turns true
                        userIsLoggedIn.toggle()
                    }
                }
            }

        }
        .ignoresSafeArea()
    }

    func login(){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in

            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }

    func register(){
        Auth.auth().createUser(withEmail: email, password: password){
            result, error in

            if error != nil{
                print(error!.localizedDescription)
            }
        }
    }

    func verifyContent(){
        // verify if username and password are not null
    }

    func signout(){
        userIsLoggedIn.toggle()
    }
}

struct Signup : View{
    // change view state
    @State private var showingMainPageView = false
    
    @State var email = ""
    @State var password = ""
    @State var userIsLoggedIn = false
    @State var reEnterPass = ""
    @State var visible = ""
    @State var reVisible = ""
    
    var body: some View{
        welcomePage
    }
    
    var welcomePage: some View{
        // Main code goes here...
        
        ZStack{
            Color.black
            
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.pink, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 1000, height: 400)
                .rotationEffect(.degrees(135))
                .offset(y: -350)
            
            VStack{
                Text("Sign Up")
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .offset(x: -100, y: -100)
                
                TextField("Email", text: $email)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: email.isEmpty){
                        Text("Email")
                            .foregroundColor(.white)
                            .bold()
                    }
                
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                
                SecureField("Password", text: $password)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: password.isEmpty){
                        Text("Password")
                            .foregroundColor(.white)
                            .bold()
                    }
                
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                
                SecureField("Password", text: $password)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: password.isEmpty){
                        Text("Re-Enter Password")
                            .foregroundColor(.white)
                            .bold()
                    }
                
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                
                Button {
                    register()
                } label: {
                    Text("Register")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.linearGradient(colors: [.pink, .red], startPoint: .top, endPoint: .bottomTrailing))
                        ).foregroundColor(.white)
                }
                .padding(.top)
                .offset(y: 100)
                
                Button {
                    login()
                } label: {
                    Text("Already have an account? Click here to Log In!")
                        .bold()
                        .frame(width: 400, height: 50)

                }
                .padding(.top)
                .offset(y: 100)
            }
            .frame(width: 350)
            .onAppear{
                Auth.auth().addStateDidChangeListener{auth, user in
                    
                    if user != nil{
                        // once logged in, turns true
                        userIsLoggedIn.toggle()
                    }
                }
            }

        }
        .ignoresSafeArea()

    }
    
    func login(){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    
    func register(){
        Auth.auth().createUser(withEmail: email, password: password){
            result, error in
            
            if error != nil{
                print(error!.localizedDescription)
            }
        }
    }
    
    func verifyContent(){
        // verify if username and password are not null
    }
    
    func signout(){
        userIsLoggedIn.toggle()
    }
}

struct Home : View{
    @State var show = false
    
    var body: some View{
        NavigationView{
            ZStack{
                NavigationLink(destination: Signup(), isActive: self.$show){
                    Text("Test")
                }
            }
            .hidden()
            
            Login()
        }
    }
}

struct ContentView: View {
    var body: some View{
        // show main home page
        Login()
    }
}

struct RandomPage: View {
    var body: some View{
        // show main home page
        Text("We have gone to another page!")
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
    
