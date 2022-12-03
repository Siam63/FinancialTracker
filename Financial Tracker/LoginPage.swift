//
//  LoginPage.swift
//  Financial Tracker
//
//  Created by Siam Rahman on 2022-12-01.
//

import SwiftUI
import Firebase

struct LoginPage: View {
    let auth = Auth.auth()
    
    @State private var showingMainPageView = false
    @State private var isLoggedIn = false // initially not logged in
    @State private var userLoggedIn = false
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        welcomePage
    }
    
    var welcomePage: some View{
        NavigationView{
            ZStack{
                Color.black
                
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .foregroundStyle(.linearGradient(colors: [.pink, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 1000, height: 400)
                    .rotationEffect(.degrees(135))
                    .offset(y: -350)

                VStack{
                    Picker("", selection: $isLoggedIn) {
                        Text("Log In")
                            .tag(true)
                        Text("Create an Account")
                            .tag(false)
                    }.pickerStyle(SegmentedPickerStyle())
                    .padding()

                    TextField("Email", text: $email)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
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
                        if isLoggedIn{
                            login()
                        }else{
                            signup()
                        }
                    } label: {
                        Text(isLoggedIn ? "Login" : "Create Account")
                            .bold()
                            .frame(width: 200, height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.linearGradient(colors: [.pink, .red], startPoint: .top, endPoint: .bottomTrailing))
                            ).foregroundColor(.white)
                    }
                    .padding(.top)
                    .offset(y: 100)
                    
                    if userLoggedIn {
                        Button("Enter"){
                            showingMainPageView.toggle()
                        }
                        .sheet(isPresented: $showingMainPageView){
                            MainPageHome()
                        }
                    }else{
                        Text("You are logged out. Please login.")
                            .foregroundColor(.white)
                            .bold()
                    }
                    
                }
                .frame(width: 350)
//                .onAppear{
//                    Auth.auth().addStateDidChangeListener{auth, user in
//
//                        if user != nil{
//                            // once logged in, turns true
//                            isLoggedIn.toggle()
//                        }
//                    }
//                }
            }.navigationTitle(isLoggedIn ? "Welcome Back!" : "Welcome!")
            .ignoresSafeArea()
        }
    }

    func login(){
        auth.signIn(withEmail: email, password: password) {
            result, error in
            
            if let error = error {
                // unsuccessful
                print("Failed due to error:", error)
                return
            }
            
            // successful login
            print("Successfully logged in with ID: \(result?.user.uid ?? "")")
            userLoggedIn.toggle()
        }
    }
    
//
    func signup(){
        auth.createUser(withEmail: email, password: password){
            result, error in
            
            if let error = error {
                // unsuccessful
                print("Failed due to error: ", error)
                return
            }
            
            // successful user creation
            print("Successfully created account with ID: \(result?.user.uid ?? "")")
        }
    }

    func verifyContent(){
        // verify if username and password are not null
    }

    func signout(){
        isLoggedIn.toggle()
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}

