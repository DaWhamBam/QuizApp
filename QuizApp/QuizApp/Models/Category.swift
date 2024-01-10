//
//  Category.swift
//  QuizApp
//
//  Created by Martin Hegel on 10.01.24.
//

import Foundation

struct Category: Identifiable {
    let id = UUID().uuidString
    
    var categoryName: String
    var categoryQuestionQty: String
    var categoryImage: String
}
