//
//  ResultView.swift
//  QuizApp
//
//  Created by Martin Hegel on 25.01.24.
//

import SwiftUI

struct ResultView: View {
    
    @State var progress: Double = 0
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("Pokal")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .padding(.vertical, 16)
                
                ZStack {
                    CircleProgressbar(progress: progress)
                        .frame(maxHeight: .infinity)
                    
                    HStack {
                        Text("23")
                            .font(.title)
                            .offset(y: -20)
                            .bold()
                        Text("/")
                            .font(.largeTitle)
                        Text("25")
                            .font(.title)
                            .offset(y: 20)
                    }
                    
                }
                
                ZStack {
                    Rectangle()
                        .frame(width: .infinity, height: .infinity)
                        .padding(.vertical)
                        .shadow(radius: 4, x: 0, y: 4)
                        .foregroundColor(Color("FourthColor"))
                    
                    HStack {
                        Text("Punkte:")
                            .font(.title)
                            .bold()
                            .foregroundStyle(.white)
                        
                        Text("20352")
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
            .background(Color("PrimaryColor"))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Text("Save")
                            .bold()
                        Image(systemName: "square.and.arrow.down")
                            .bold()
                            .foregroundStyle(Color.blue)
                    }
                }
            }
            
        }
    }
    
    
    @StateObject private var categoryViewModel = CategoryListViewModel()
    
    func resetProgress() {
        progress = 0.36
        }
    
}

#Preview {
    ResultView()
}
