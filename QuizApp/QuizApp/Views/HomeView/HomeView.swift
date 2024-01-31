//
//  HomeView.swift
//  QuizApp
//
//  Created by Martin Hegel on 09.01.24.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
        NavigationStack {
            ZStack(alignment: .bottom) {
                
                VStack{
                    HStack {
                        VStack {
                            Text("Hello Martin!")
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
                                
                                Text("2000")
                                
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
                                
                                Text("3521")
                                
                            }
                        }
                    }
                    
                    Divider()
                        
                    
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(categoryViewModel.categories) { category in
                                NavigationLink {
                                    Text(category.name)
                                } label: {
                                    CategoryCardView(categoryViewModel: category)
                                        .padding(.top, 30)
                                }
                            }
                        }
                    }
                   .padding(.horizontal, 70)
                    
                }
                
                NavigationLink {
                    WrapperQuizView()
                } label: {
                    Text("Custom Quiz")
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
            .background(Color("PrimaryColor"))
        }
        
    }
    
    
    @StateObject private var categoryViewModel = CategoryListViewModel()
    @Binding var tab: TabItem
    let columns = [GridItem(spacing: 15), GridItem(spacing: 15)]
    
    
}

#Preview {
    HomeView(tab: .constant(.home))
}
