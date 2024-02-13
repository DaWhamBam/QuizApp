//
//  ContentView.swift
//  QuizApp
//
//  Created by Martin Hegel on 04.01.24.
//

import SwiftUI

struct SignInView: View {
    var body: some View {
        ZStack {
            Image("LogoTransparent")
                .resizable()
                .scaledToFill()
                .frame(width: 500, height: 1000)
                .blur(radius: 30)
                .opacity(0.5)
            
            
            VStack {
                Image("LogoTransparent")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding(.top, 200)
                
                TextField("E-Mail", text: $email)
                    .frame(width: 250, height: 30)
                    .background(Color.white)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .padding(.all)
                    .padding(.top, 50)
                
                TextField("Password", text: $password)
                    .frame(width: 250, height: 30)
                    .background(Color.white)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 10)
                
                
                
                PrimaryButton(title: mode.title, action: authenticate)
                    .disabled(disableAuthentification)
                    .padding(.horizontal, 74)
                
                Spacer()
                
                
                TextButton(title: mode.alternitiveTitle, action: switchAuthentificationMode)
                
                Spacer()
                
            }
            .padding(48)
            
            
            
        }
        .font(.headline)
        .background(Color("MainColor"))
        .textInputAutocapitalization(.never)
        
        
    }
    
    @EnvironmentObject private var userViewModel: UserViewModel
    
    @State private var mode: AuthentificationMode = .login
    @State private var email = ""
    @State private var password = ""
    
    private var disableAuthentification: Bool {
        email.isEmpty || password.isEmpty
    }
    
    private func switchAuthentificationMode() {
        mode = mode == .login ? .register : .login
    }
    
    private func authenticate() {
        switch mode {
        case .login:
            userViewModel.login(email: email, password: password)
        case .register:
            userViewModel.register(email: email, password: password)
        }
    }
    
    
}

#Preview {
    SignInView()
}
