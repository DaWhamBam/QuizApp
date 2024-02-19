//
//  HomeView.swift
//  QuizApp
//
//  Created by Martin Hegel on 09.01.24.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
        
        ZStack(alignment: .bottom) {
            
            VStack{
                HStack {
                    VStack {
                        Text("Hello \(userViewModel.user?.name ?? "")!")
                            .bold()
                            .font(.title)
                            .padding(.leading, 72)
                        Text("Let's start some Quiz!")
                            .font(.headline)
                            .padding(.leading, 80)
                    }
                    
                    Spacer()
                    
                    Image("LogoTransparent")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 60, height: 60)
                        .padding(.trailing, 80)
                }
                
                Divider()
                
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25.0)
                            .foregroundColor(Color("SecondColor"))
                            .frame(width: 250, height: 40)
                            .shadow(radius: 5, x: 0, y: 4)
                        
                        
                        HStack {
                            Text("Points:")
                                .bold()
                            
                            Text("\(userViewModel.user?.points ?? 0)" )
                            
                        }
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25.0)
                            .foregroundColor(Color("SecondColor"))
                            .frame(width: 250, height: 40)
                            .shadow(radius: 5, x: 0, y: 4)
                        
                        HStack {
                            Text("Rank:")
                                .bold()
                            
                            Text(userViewModel.user?.rank ?? "9999")
                            
                        }
                    }
                }
                
                Divider()
                
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(categoryViewModel.categories) { category in
                            Button {
                                categoryViewModel.selectedCategorie = category.name
                                shouldShowNewQuiz = true
                                
                                
                            } label: {
                                CategoryCardView(categoryViewModel: category)
                                    .padding(.top, 30)
                            }
                            .fullScreenCover(isPresented: $shouldShowNewQuiz){
                                NavigationStack{
                                    GameEditView(isPresented: $shouldShowNewQuiz)
                                        .environmentObject(userViewModel)
                                        .environmentObject(categoryViewModel)
                                }
                            }
                        }
                        
                    }
                    .padding(.horizontal, 70)
                    .padding(.bottom, 64)
                }
                
                
            }
            
            Button {
                shouldShowRandomQuiz = true
                
            } label: {
                Text("Random Quiz")
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
        .background(Color("MainColor"))
        .navigationBarBackButtonHidden(true)
        .fullScreenCover(isPresented: $shouldShowRandomQuiz) {
            NavigationStack {
                WrapperQuizView(isPresented: $shouldShowRandomQuiz)
                    .environmentObject(userViewModel)
            }
        }
        
    }
  
    
    @StateObject private var userViewModel = UserViewModel()
    @StateObject private var categoryViewModel = CategoryListViewModel()
    @Binding var tab: TabItem
    let columns = [GridItem(spacing: 15), GridItem(spacing: 15)]
    @State private var shouldShowRandomQuiz = false
    @State private var shouldShowNewQuiz = false
    
    
    
    
}

#Preview {
    HomeView(tab: .constant(.home))
}
