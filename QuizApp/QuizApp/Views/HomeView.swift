//
//  HomeView.swift
//  QuizApp
//
//  Created by Martin Hegel on 09.01.24.
//

import SwiftUI

struct HomeView: View {
    
    var category: [String] = ["Category 1", "Category 2"]
    
    var body: some View {
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
            
            List {
                Section(header: Text("Category")) {
                    ForEach(category, id: \.self) {
                        Text($0)
                    }
                }
            }
            
            
            
        }
    }
    
    
    @Binding var tab: TabItem
    
}

#Preview {
    HomeView(tab: .constant(.home))
}
