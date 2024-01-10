//
//  CategoryViewModel.swift
//  QuizApp
//
//  Created by Martin Hegel on 10.01.24.
//

import Foundation

@MainActor
class CategoryViewModel: ObservableObject {
    
    @Published var categories = [Category]()
    
    func fetchCategories() {
        categories = [Category(categoryName: "Books", categoryQuestionQty: "15", categoryImage: "CA_Books")]
    }
}
