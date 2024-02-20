//
//  SettingsView.swift
//  QuizApp
//
//  Created by Martin Hegel on 09.01.24.
//

import SwiftUI

struct SettingsSheet: View {
    
    init(isPresented: Binding<Bool>, name: String) {
        self._isPresented = isPresented
        self._name = State(initialValue: name)
    }
    
    var body: some View {
        VStack(spacing: 44) {
            
            Text("Change Profil")
                .bold()
                .padding()
            
            HStack {
                Text("Username")
                    .bold()
                    .font(.headline)
                    
                
                TextField("Enter your name", text: $name)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(.headline)
                    
            }
            .padding(.top, 50)
            .padding(.horizontal, 40)
            
            Spacer()
            
            Button(action: closeSheet) {
                Text("Update")
                    .padding(.bottom, 50)
                    .font(.title2)
            }
            
            
            
        }
        .navigationBarTitle("Settings", displayMode: .inline)
        
        
    }
    
    @EnvironmentObject private var userViewModel: UserViewModel
    @State private var name = ""
    @Binding var isPresented: Bool
    
    private func closeSheet() {
        isPresented = false
        userViewModel.updateName(with: userViewModel.user?.id ?? "", name: name)
    }
    
    
}

#Preview {
    SettingsSheet(isPresented: .constant(false), name: "Martin")
        .environmentObject(UserViewModel())
}
