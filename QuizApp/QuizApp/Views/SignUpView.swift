//
//  ContentView.swift
//  QuizApp
//
//  Created by Martin Hegel on 04.01.24.
//

import SwiftUI

struct SignUpView: View {
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
               
               TextField("E-Mail", text: $name)
                   .frame(width: 250, height: 30)
                   .background(Color.white)
                   .textFieldStyle(RoundedBorderTextFieldStyle())
                   .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                   .padding(.all)
                   .padding(.top, 50)
               
               TextField("Password", text: $name)
                   .frame(width: 250, height: 30)
                   .background(Color.white)
                   .textFieldStyle(RoundedBorderTextFieldStyle())
                   .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                   .padding(.bottom, 10)
               
               Button {
               } label: {
                   Text("Sign Up")
               }
               .buttonStyle(.borderedProminent)
               .tint(Color("ButtonColor"))
               .foregroundColor(.black)
               .padding(.all)
               
               Spacer()
               
               Button() {
                   
               } label: {
                   Text("Sign In")
               }
               .buttonStyle(.bordered)
               .tint(Color("ButtonColor"))
               .foregroundColor(.black)
               .padding(.bottom, 150)
               
           }
        }
        .background(Color("PrimaryColor"))
    }
    
    @State private var name = ""
}

#Preview {
    SignUpView()
}
