//
//  TaskEdidView.swift
//  QuizApp
//
//  Created by Martin Hegel on 05.02.24.
//

import SwiftUI

struct TaskEditView: View {
    
    /*
     init(isPresented: Binding<Bool>, title: String) {
     self._isPresented = isPresented
     self._title = State(initialValue: title)
     }
     */
 
    
    
    
    
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Text(title)
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.black)
                
                Picker("test", selection: $selectedAmount) {
                    ForEach(amount, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.menu)
                
                
                NavigationLink {
                    WrapperQuizView()
                    
                    
                } label: {
                    Text("Start Quiz")
                        .font(.title2)
                        .bold()
                        .foregroundStyle(.black)
                }
                //.foregroundColor(.blue)
                .frame(width: 300, height: 50)
                .background(Color("SecondColor"))
                .clipShape(Capsule())
                .shadow(radius: 4, x: 0, y: 4)
                .offset(y: -8)
            }
            
        }
    }
    
    @EnvironmentObject private var questionViewModel: QuestionListViewModel
    
    @Binding var isPresented: Bool
    @State var title: String
    
    var amount = ["1", "2", "3"]
    @State private var selectedAmount = "1"
  
    
    
}

#Preview {
    TaskEditView(isPresented: .constant(false), title: "Book")
}
