//
//  CategoryCardView.swift
//  QuizApp
//
//  Created by Martin Hegel on 10.01.24.
//

import SwiftUI

struct CategoryCardView: View {
    var body: some View {
        ZStack {
            
            ZStack {
                
                ZStack {

                        VStack {
                            Text(categoryViewModel.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                                .padding(.leading, 40)
                                .padding(.top, 60)
                            
                            //Text(category.categoryQuestionQty)
                            //.font(.headline)
                            
                        }
                        .padding(16)
                }
                
                .frame(maxWidth: .infinity, maxHeight: 150)
                .background(Color("FourthColor"))
                .cornerRadius(10.0)
                .shadow(radius: 5, x: 0, y: 4)
                
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: 200)
            .background(Color("SecondColor"))
            .cornerRadius(10.0)
            
            .shadow(radius: 5, x: 0, y: 4)
            
            Image("CA_Books")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 120, maxHeight: 120)
                .offset(x: -30, y: -50)
            
        }
    }
    
    @ObservedObject var categoryViewModel: CategoryViewModel
    
}

#Preview {
    CategoryCardView(categoryViewModel: CategoryViewModel(category: Category(id: 12, name: "Books")))
}
