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
            
            checkAnwser()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                questionViewModel.endGame()
            }
            
            
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
        
        .background(colorChange)
        .cornerRadius(10.0)
        // .padding(.leading, 5)
        //.padding(.trailing, 5)
        .shadow(radius: 4, x: 0, y: 4)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    @State var colorChange: Color = Color("FourthColor")
    @EnvironmentObject var questionViewModel: QuestionListViewModel
    
    
    func checkAnwser() {
        
        if buttonText == questionViewModel.correctAnswer {
            colorChange = Color.green
        } else {
            colorChange = Color.red
        }
        
        
    }
    
}

#Preview {
    AnswerButton(buttonText: "Antwort 1")
}
