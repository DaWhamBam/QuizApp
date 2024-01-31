//
//  AnswerButtonLeft.swift
//  QuizApp
//
//  Created by Martin Hegel on 24.01.24.
//

import SwiftUI

struct AnswerButton: View {
    @State var buttonText: String
    
    var body: some View {
        Button {
            
            self.didTap = DidTap()
            
        } label: {
            Text(buttonText)
                .font(.title2)
                .foregroundStyle(.white)
                .padding()
                .fontWidth(.standard)
                .multilineTextAlignment(.center)
                .background(.white.opacity(0.0001))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .frame(minHeight: 150)
        }
        
        .background(didTap ? Color("ThirdColor") : Color("FourthColor"))
        .cornerRadius(10.0)
       // .padding(.leading, 5)
        //.padding(.trailing, 5)
        .shadow(radius: 4, x: 0, y: 4)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    @State private var didTap: Bool = false
    
    func DidTap() -> Bool {
        if self.didTap == false {
            return true
        } else {
            return false
        }
        
    }
    
}

#Preview {
    AnswerButton(buttonText: "Antwort 1")
}
