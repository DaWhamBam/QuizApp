//
//  QuestionModel.swift
//  QuizApp
//
//  Created by Martin Hegel on 24.01.24.
//

import Foundation

struct QuestionResult: Codable {
    let results: [Question]
}

struct Question: Codable {
    let id: Int
    let difficulty: String
    let category: String
    let question: String
    let correct_answer: String
    let incorrect_answers: [String]
}

