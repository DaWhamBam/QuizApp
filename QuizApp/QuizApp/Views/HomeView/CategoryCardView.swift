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
                Image(category.categoryImage)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 150, maxHeight: 150)
                    //.offset(y: -50)
                
                
                VStack {
                    Text(category.categoryName)
                        .font(.title)
                    
                    Text(category.categoryQuestionQty)
                        .font(.headline)
                    
                }
            }
        }
        
        .frame(maxWidth: 150, maxHeight: 150)
        .background(Color.gray)
        .cornerRadius(10.0)
    }
    
    let category: Category
}

#Preview {
    CategoryCardView(category: Category(categoryName: "Books", categoryQuestionQty: "15 Questions", categoryImage: "CA_Books"))
}
