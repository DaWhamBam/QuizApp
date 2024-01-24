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
                Text(categoryViewModel.name)
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding(.leading, 40)
                    .padding(.top, 60)
            }
            .padding(16)
            
            .frame(maxWidth: .infinity, maxHeight: 150)
            .background(Color("FourthColor"))
            .cornerRadius(10.0)
            .shadow(radius: 5, x: 0, y: 4)
            
            Image("CA_Books")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .offset(x: -30, y: -50)
            
        }
    }
    
    @ObservedObject var categoryViewModel: CategoryViewModel
    
}

#Preview {
    CategoryCardView(categoryViewModel: CategoryViewModel(category: Category(id: 12, name: "Books")))
}
