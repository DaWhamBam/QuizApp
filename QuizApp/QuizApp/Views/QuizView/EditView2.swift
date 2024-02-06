//
//  TaskEdidView.swift
//  QuizApp
//
//  Created by Martin Hegel on 05.02.24.
//

import SwiftUI

struct EditView2: View {

    var body: some View {
        NavigationStack {
            VStack {
                
                Text(title)
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.black)
                
                Picker("test", selection: $questionViewModel.amountQuestions) {
                    ForEach(questionViewModel.amount, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.menu)
                 
                 
                
                
                NavigationLink {
                    WrapperQuizView(questionViewModel: questionViewModel)
                } label: {
                    Text("Start Quiz")
                        .font(.title2)
                        .bold()
                        .foregroundStyle(.black)
                }
                .frame(width: 300, height: 50)
                .background(Color("SecondColor"))
                .clipShape(Capsule())
                .shadow(radius: 4, x: 0, y: 4)
                .offset(y: -8)
                
            }
            
        }
    }
    
   @StateObject private var questionViewModel = QuestionListViewModel()
    
   // @Binding var isPresented: Bool
    @State var title: String
    
    
    

}

#Preview {
    EditView2( title: "Book")
}
