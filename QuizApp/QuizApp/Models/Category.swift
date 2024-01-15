//
//  Category.swift
//  QuizApp
//
//  Created by Martin Hegel on 10.01.24.
//

import Foundation

struct CategoryResult: Codable {
    let trivia_categories: [Category]
}

struct Category: Codable {
    let id: Int
    let name: String
}
