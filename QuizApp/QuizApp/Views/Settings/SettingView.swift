//
//  SettingView.swift
//  QuizApp
//
//  Created by Martin Hegel on 15.02.24.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        
        NavigationStack {
            
            
            
            VStack(spacing: 44) {
                
                Image("LogoTransparent")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 80)
                    .padding(.top, 100)
                    
                
                Text(userViewModel.user?.name ?? "Martin")
                    .font(.title)
                    .bold()
                
                Spacer()
                
                

            }
            .navigationBarTitle("Settings", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        editName()
                        
                    } label: {
                        Image(systemName: "gear")
                            .bold()
                            .foregroundStyle(Color.black)
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        userViewModel.logout()
                        
                    } label: {
                        Image(systemName: "rectangle.portrait.and.arrow.forward")
                            .bold()
                            .foregroundStyle(Color.black)
                    }
                }
            }
            
            
            
        }
        .sheet(isPresented: $shouldShowSheet) {
            SettingsSheet(isPresented: $shouldShowSheet, name: userViewModel.user!.name)
                .interactiveDismissDisabled()
        }
        
        
    }
    
    
    @EnvironmentObject private var userViewModel: UserViewModel
    @State private var shouldShowSheet = false
    
    
    private func editName() {
        shouldShowSheet.toggle()
    }
    
}

 #Preview {
 SettingView()
         .environmentObject(UserViewModel())
 }
 
