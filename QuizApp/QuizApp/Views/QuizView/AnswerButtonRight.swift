//
//  AnswerButton.swift
//  QuizApp
//
//  Created by Martin Hegel on 24.01.24.
//

import SwiftUI

struct AnswerButtonRight: View {
    
    @State var buttonText: String
    
    var body: some View {
        Button {
            
        } label: {
            Text(buttonText)
                .font(.title2)
                .foregroundStyle(.white)
                .padding()
                .fontWidth(.standard)
                .multilineTextAlignment(.center)
                .background(.white.opacity(0.0001))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
        .background(Color("FourthColor"))
        .cornerRadius(10.0)
        .padding(.leading, 2)
        .padding(.trailing, 10)
        .shadow(radius: 4, x: 0, y: 4)
    }
}

#Preview {
    AnswerButtonRight(buttonText: "")
}
