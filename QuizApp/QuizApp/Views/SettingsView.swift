//
//  SettingsView.swift
//  QuizApp
//
//  Created by Martin Hegel on 09.01.24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        Text("Settings")
        
        PrimaryButton(title: "Logout", action: userViewModel.logout)
            .padding(48)
        
        
    }
    
    @EnvironmentObject private var userViewModel: UserViewModel
    
}

#Preview {
    SettingsView()
}
