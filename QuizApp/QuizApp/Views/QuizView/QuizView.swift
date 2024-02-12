//
//  QuizView.swift
//  QuizApp
//
//  Created by Martin Hegel on 23.01.24.
//

import SwiftUI

struct QuizView: View {
    
    var body: some View {
        ZStack {
            
            Color("MainColor")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    HStack {
                        Text("Points:")
                            .frame(alignment: .leading)
                            .padding(.leading, 16)
                        
                        Text("124")
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    HStack {
                        
                        
                        Text(String(questionViewModel.questions.count))
                            .bold()
                            .font(.title)
                        
                        Text("/")
                        
                        Text(String(questionViewModel.questionsAmount.count))
                    }
                    
                    HStack {
                        Text("Timer:")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        //.padding(.leading, 16)
                        
                        Text("60")
                            .frame(alignment: .trailing)
                            .padding(.trailing, 16)
                    }
                }
                
                .padding(.top, 16)
                
                ProgressBar()
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
                
                Divider()
                    .padding(.bottom, 8)
                
                if questionViewModel.currentQuestion != nil {
                    
                    let question = questionViewModel.currentQuestion!
                    
                    
                    ZStack {
                        
                        Rectangle()
                            .frame(maxWidth: .infinity, maxHeight: 200)
                            .padding(.vertical)
                            .shadow(radius: 4, x: 0, y: 4)
                            .foregroundColor(Color("FourthColor"))
                        
                        
                        Text(question.question)
                            .font(.title2)
                            .foregroundStyle(.white)
                            .padding()
                            .fontWidth(.standard)
                            .multilineTextAlignment(.center)
                        
                        
                    }
                    
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(questionViewModel.answers, id: \.self) { answers in
                            
                            AnswerButton(buttonText: answers)
                            
                        }
                    }
                    .padding(.horizontal, 10)
                    
                    
                   
                }
            }
            .navigationBarTitle("Category", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        showAlert.toggle()
                        //HomeView(tab: $selectedTab)
                    } label: {
                        Image(systemName: "x.circle")
                            .bold()
                            .foregroundStyle(Color.black)
                    }
                    .alert("Attentione", isPresented: $showAlert) {
                        Button("Continue", role: .cancel, action: {})
                        Button("End Quiz", action: {
                            
                            questionViewModel.isFinished = true
                            
                        })
                    }
                }
            }
            .background(Color("MainColor"))
            .navigationBarBackButtonHidden(true)
            .toolbar(.hidden, for: .tabBar)
            
        }
        
    }
    
    @EnvironmentObject private var questionViewModel: QuestionListViewModel
    let columns = [GridItem(), GridItem()]
    @State private var selectedTab: TabItem = .home
    @State private var showAlert = false
    
}


#Preview {
    NavigationStack {
        QuizView()
            .environmentObject(QuestionListViewModel(selectedAmount: 1, category: "10", difficulty: ""))
    }
}
