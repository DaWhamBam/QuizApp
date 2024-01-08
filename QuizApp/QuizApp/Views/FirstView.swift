//
//  ContentView.swift
//  QuizApp
//
//  Created by Martin Hegel on 04.01.24.
//

import SwiftUI

struct FirstView: View {
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
                    .frame(width: 100, height: 100)
                
                HStack {
                    Button {
                        
                    } label: {
                        Text("Sign in")
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color("ButtonColor"))
                    .foregroundColor(.black)
                    
                    Button {
                        
                    } label: {
                        Text("Sign up")
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color("ButtonColor"))
                    .foregroundColor(.black)
                }
            }
        }
        .background(Color("PrimaryColor"))
    }
}

#Preview {
    FirstView()
}
