//
//  UserViewModel.swift
//  QuizApp
//
//  Created by Martin Hegel on 12.02.24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift


class UserViewModel: ObservableObject {
    
    init() {
        checkAuth()
    }
    
    
    private var auth = Auth.auth()
    
    @Published var user: FireUser?
    
    
    private var listener: ListenerRegistration?
    
    var userIsLoggedIn: Bool {
        user != nil
    }
    
    var email: String {
        user?.email ?? ""
    }
    
    
    private func checkAuth() {
        guard let currentUser = auth.currentUser else {
            print("Not logged in")
            return
        }
        
        self.fetchUser(with: currentUser.uid)
    }
    
    
    
    func login(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { authResult, error in
            if let error {
                print("Login failed:", error.localizedDescription)
                return
            }
            guard let authResult, let email = authResult.user.email else { return }
            print("User with email '\(email)' is logged in with id '\(authResult.user.uid)'")
            
            self.fetchUser(with: authResult.user.uid)
            
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
            
            self.createUser(with: authResult.user.uid, email: email)
            
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


extension UserViewModel {
    
    
    private func createUser(with id: String, email: String) {
        let user = FireUser(id: id, email: email, registeredAt: Date())
        
        do {
            try FirebaseManager.shared.database.collection("users").document(id).setData(from: user)
            
        } catch let error {
            print("Failed saving users: \(error)")
        }
    }
    
    private func fetchUser(with id: String) {
        
        self.listener = FirebaseManager.shared.database.collection("users")
            .whereField("id", isEqualTo: id)
            .addSnapshotListener { querySnapshot, error in
                if let error {
                    print(error.localizedDescription)
                    return
                }
                
                guard let documents = querySnapshot?.documents else {
                    print("Fehler beim Laden der Tasks")
                    return
                }
                
                let user = documents.compactMap { queryDocumentSnapshot -> FireUser? in
                    try? queryDocumentSnapshot.data(as: FireUser.self)
                }.first
                
                self.user = user
            }
    }
    
    func updatePoints(with id: String, rightQuestions: [Question]) {
        let oldUserPoints = user?.points
        let userpoints = FirebaseManager.shared.database.collection("users").document(id)
        let newUserpoints = oldUserPoints! + (rightQuestions.count * 10)
        
        userpoints.updateData([
            "points" : newUserpoints
        ])
        print("Document successfully updated")
    }
    
    func updateName(with id: String, name: String) {
        let userName = FirebaseManager.shared.database.collection("users").document(id)
        
        userName.updateData([
            "name": name
        ]) { error in
            if let error = error {
                print("Error updating document: \(error)")
            } else {
                print("Document successfully updated")
            }
        }
        
    }
    
}

