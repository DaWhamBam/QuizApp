//
//  ResultView.swift
//  QuizApp
//
//  Created by Martin Hegel on 25.01.24.
//

import SwiftUI

struct ResultView: View {
    

    var body: some View {
        NavigationStack {
            VStack {
                Image("Pokal")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .padding(.vertical, 16)
                
                ZStack {
                    CircleProgressbar(progress: questionViewModel.progressNumber())
                        .frame(maxHeight: .infinity)
                    
                    HStack {
                        Text(String(questionViewModel.rightQuestions.count))
                            .font(.title)
                            .offset(y: -20)
                            .bold()
                        Text("/")
                            .font(.largeTitle)
                        Text(String(questionViewModel.questionsAmount.count))
                            .font(.title)
                            .offset(y: 20)
                    }
                    
                }
                
                ZStack {
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(.vertical)
                        .shadow(radius: 4, x: 0, y: 4)
                        .foregroundColor(Color("FourthColor"))
                    
                    HStack {
                        Text("Points:")
                            .font(.title)
                            .bold()
                            .foregroundStyle(.white)
                        
                        Text("\(questionViewModel.rightQuestions.count * 10)" )
                            .font(.title)
                            .bold()
                            .foregroundStyle(.white)
                    }
                }
                
                Divider()
                
                ScrollView {
                    
                    ForEach(categoryViewModel.categories) { category in
                        Text(category.name)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .padding(12)
                            .background(Color("FourthColor"))
                            .clipShape(Capsule())
                    }
                    .padding(.bottom, 16)
                    
                }
            }
            .background(Color("MainColor"))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        ContentView()
                        
                    } label: {
                        Text("Save")
                            .bold()
                        Image(systemName: "square.and.arrow.down")
                            .bold()
                            .foregroundStyle(Color.blue)
                    }
                    .onAppear() {
                        userViewModel.updatePoints(with: userViewModel.user?.id ?? "", rightQuestions: questionViewModel.rightQuestions)
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .toolbar(.hidden, for: .tabBar)
            
        }
    }
    
    @EnvironmentObject private var userViewModel: UserViewModel
    @StateObject private var categoryViewModel = CategoryListViewModel()
    @EnvironmentObject private var questionViewModel: QuestionListViewModel
    @State private var selectedTab: TabItem = .home
    
    
    
    
    
}

#Preview {
    ResultView()
}
