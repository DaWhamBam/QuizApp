//
//  UserViewModel.swift
//  QuizApp
//
//  Created by Martin Hegel on 12.02.24.
//

import Foundation
import FirebaseAuth


class UserViewModel: ObservableObject {
    
    init() {
        checkAuth()
    }
    
    
    private var auth = Auth.auth()
    
    @Published var user: User?
    
    
    var userIsLoggedIn: Bool {
        user != nil
    }
    
    
    private func checkAuth() {
        guard let currentUser = auth.currentUser else {
            print("Not logged in")
            return
        }
        
        self.user = currentUser
    }
    
    
    
    func login(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { authResult, error in
            if let error {
                print("Login failed:", error.localizedDescription)
                return
            }
            guard let authResult, let email = authResult.user.email else { return }
            print("User with email '\(email)' is logged in with id '\(authResult.user.uid)'")
            
            self.user = authResult.user
            
            
            
        }
    }
    
    
    func register(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { authResult, error in
            if let error {
                print("Registration failed:", error.localizedDescription)
                return
            }
            guard let authResult, let email = authResult.user.email else { return }
            print("User with email '\(email)' is registered with id '\(authResult.user.uid)'")
            
            self.login(email: email, password: password)
            
        }
    }
    
    
    func logout() {
        do {
            try auth.signOut()
            self.user = nil
            print("User is logout!")
        } catch {
            print("Error signing out: ", error.localizedDescription)
        }
    }
    
    
    
    
}

