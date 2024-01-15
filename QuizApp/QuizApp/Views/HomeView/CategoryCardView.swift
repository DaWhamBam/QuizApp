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
            
            VStack {
                Image("CA_Books")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 150, maxHeight: 150)
                    //.offset(y: -50)
                
                
                VStack {
                    Text(categoryViewModel.name)
                        .font(.title)
                    
                    //Text(category.categoryQuestionQty)
                        //.font(.headline)
                    
                }
            }
        }
        
        .frame(maxWidth: .infinity, maxHeight: 150)
        .background(Color.gray)
        .cornerRadius(10.0)
    }
    
    @ObservedObject var categoryViewModel: CategoryViewModel
    
}

#Preview {
    CategoryCardView(categoryViewModel: CategoryViewModel(category: Category(id: 12, name: "Books")))
}
