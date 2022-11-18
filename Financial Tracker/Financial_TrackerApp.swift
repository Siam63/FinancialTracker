//
//  Financial_TrackerApp.swift
//  Financial Tracker
//
//  Created by Siam Rahman on 2022-11-18.
//

import SwiftUI
import Firebase

@main
struct Financial_TrackerApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
