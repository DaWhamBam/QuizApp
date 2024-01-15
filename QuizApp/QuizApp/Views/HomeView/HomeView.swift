//
//  HomeView.swift
//  QuizApp
//
//  Created by Martin Hegel on 09.01.24.
//

import SwiftUI

struct HomeView: View {
    
    let columns = [GridItem(spacing: 50), GridItem()]

    var body: some View {
        
        NavigationStack {
            VStack{
                HStack {
                    VStack {
                        Text("Hello Martin!")
                            .bold()
                            .font(.title)
                            .padding(.leading, 16)
                        Text("Let's start some Quiz!")
                            .font(.headline)
                            .padding(.leading, 24)
                    }
                    
                    Spacer()
                    
                    
                    Image("LogoTransparent")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 60, height: 60)
                        .padding(.trailing, 16)
                    
                }
                
                // Spacer()
                
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25.0)
                            .foregroundColor(.blue)
                            .frame(width: 250, height: 40)
                        
                        
                        HStack {
                            Text("Points:")
                                .bold()
                            //  .padding(.leading, 24)
                            
                            // Spacer()
                            
                            Text("2000")
                            
                        }
                        
                    }
                    // .padding(.leading, 40)
                    
                    Spacer()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25.0)
                            .foregroundColor(.blue)
                            .frame(width: 250, height: 40)
                        
                        HStack {
                            Text("Rank:")
                                .bold()
                            
                            
                            Text("3521")
                            
                        }
                        
                    }
                    // .padding(.trailing, 32)
                    
                    
                }
                /*
                List(categoryViewModel.categories, id: \.id) { category in
                    VStack() {
                        Text(category.name)
                    }
                }
                 */
                
               
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 50) {
                            ForEach(categoryViewModel.categories) { category in
                                NavigationLink {
                                    Text(category.name)
                                } label: {
                                    CategoryCardView(categoryViewModel: category)
                                }
                            }
                        }
                }
            }
        }
    }
    
    @StateObject private var categoryViewModel = CategoryListViewModel()
    @Binding var tab: TabItem
    
    
}

#Preview {
    HomeView(tab: .constant(.home))
}
