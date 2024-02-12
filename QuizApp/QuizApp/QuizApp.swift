//
//  QuizAppApp.swift
//  QuizApp
//
//  Created by Martin Hegel on 04.01.24.
//

import SwiftUI
import Firebase

@main
struct QuizApp: App {
    
    init() {
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            if userViewmodel.userIsLoggedIn {
                ContentView()
                    .environmentObject(userViewmodel)
            } else {
                SignInView()
                    .environmentObject(userViewmodel)
            }
        }
    }
    
    
    @StateObject private var userViewmodel = UserViewModel()
    
    
}
