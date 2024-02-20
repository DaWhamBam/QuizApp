//
//  BoardView.swift
//  QuizApp
//
//  Created by Martin Hegel on 09.01.24.
//

import SwiftUI

struct BoardView: View {
    var body: some View {
            
            VStack(spacing: 8) {
                
                HStack(spacing: 8) {
                    
                    VStack(spacing: 8) {
                        
                        Spacer()
                        
                        Image("LogoTransparent")
                            .resizable()
                            .frame(maxWidth: .infinity)
                            .aspectRatio(contentMode: .fit)
                        
                        Text("Markus")
                            .font(.title2)
                            .bold()
                        
                        Text("Points: 12345")
                            .font(.headline)
                        
                        Rectangle()
                            .frame(maxWidth: .infinity, maxHeight: 120)
                            .foregroundColor(.gray)
                            .shadow(radius: 10)
                    }
                    .padding()
                    
                    
                    
                    VStack(spacing: 8) {
                        
                        Spacer()
                        
                        Image("LogoTransparent")
                            .resizable()
                            .frame(maxWidth: .infinity)
                            .aspectRatio(contentMode: .fit)
                        
                        Text("Lisa")
                            .font(.title2)
                            .bold()
                        
                        Text("Points: 234567")
                            .font(.headline)
                        
                        Rectangle()
                            .frame(maxWidth: .infinity, maxHeight: 160)
                            .foregroundColor(.yellow)
                            .shadow(radius: 10)
                        
                        
                    }
                    .padding()
                    
                    VStack(spacing: 8) {
                        
                        Spacer()
                        
                        Image("LogoTransparent")
                            .resizable()
                            .frame(maxWidth: .infinity)
                            .aspectRatio(contentMode: .fit)
                        
                        Text("Joker")
                            .font(.title2)
                            .bold()
                        
                        Text("Points: 2651")
                            .font(.headline)
                        
                        Rectangle()
                            .frame(maxWidth: .infinity, maxHeight: 80)
                            .foregroundColor(.brown)
                            .shadow(radius: 10)
                        
                    }
                    .padding()
                }
                
                Divider()
                
                VStack(spacing: 8) {
                    
                    Text("Leaderboard")
                        .font(.title)
                        .bold()
                    
                    Spacer()
                    
                    
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

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("MainColor"))
            
            
        
    }
    
    
    
    @EnvironmentObject var categoryViewModel: CategoryListViewModel
    
    
    
}

#Preview {
    BoardView()
        .environmentObject(CategoryListViewModel())
}
