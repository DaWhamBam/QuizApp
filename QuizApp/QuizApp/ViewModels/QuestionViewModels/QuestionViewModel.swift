//
//  QuestionViewModel.swift
//  QuizApp
//
//  Created by Martin Hegel on 25.01.24.
//

import Foundation

class QuestionViewModel: ObservableObject, Identifiable {
    
    init(question: Question) {
        self.id = question.id
        self.question = question.question
        self.correct_answer = question.correct_answer
        self.difficulty = question.difficulty
        self.category = question.category
        self.incorrect_answers = question.incorrect_answers
    }
    
    let id: Int
    @Published var question: String
    @Published var correct_answer: String
    @Published var difficulty: String
    @Published var category: String
    @Published var incorrect_answers: [String]
    
}
