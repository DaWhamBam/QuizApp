//
//  AuthentificationMode.swift
//  QuizApp
//
//  Created by Martin Hegel on 12.02.24.
//

import Foundation

enum AuthentificationMode {
    case login, register
    
    
    var title: String {
        switch self {
        case .login: return "Log in"
        case .register: return "Sign up"
        }
    }
    
    var alternitiveTitle: String {
        switch self {
        case .login: return "No Account? Sigh up here ->"
        case .register: return "Allready have an account? Log in here ->"
        }
    }
    
}
