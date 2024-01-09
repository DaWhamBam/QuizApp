//
//  FirstView.swift
//  QuizApp
//
//  Created by Martin Hegel on 09.01.24.
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
                    .frame(width: 150, height: 150)
                    .padding(.bottom, 50)
                
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
                    .buttonStyle(.bordered)
                    .tint(Color("ButtonColor"))
                    .foregroundColor(.black)
                }
                .padding(.bottom, 100)
            }
        }
        .background(Color("MainColor"))
    }
}


#Preview {
    FirstView()
}
