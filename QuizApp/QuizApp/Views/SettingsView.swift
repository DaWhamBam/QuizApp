//
//  SettingsView.swift
//  QuizApp
//
//  Created by Martin Hegel on 09.01.24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            
            TextField("\(userViewModel.user?.name ?? "")", text: $name)
                .onSubmit {
                    userViewModel.updateName(with: userViewModel.user?.id ?? "", name: name)
                }
            
            PrimaryButton(title: "Logout", action: userViewModel.logout)
                .padding(48)
            
        }
        .navigationBarTitle("Settings", displayMode: .inline)
        
        
    }
    
    @EnvironmentObject private var userViewModel: UserViewModel
    @State private var name = ""
    
    
}

#Preview {
    SettingsView()
}
