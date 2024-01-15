//
//  CategoryViewModel.swift
//  QuizApp
//
//  Created by Martin Hegel on 15.01.24.
//

import Foundation

class CategoryViewModel: ObservableObject, Identifiable {
    
    init(category: Category) {
        self.id = category.id 
        self.name = category.name 
    }
    
    
    let id: Int
    @Published var name: String
}
