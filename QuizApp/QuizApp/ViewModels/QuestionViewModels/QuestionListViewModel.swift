//
//  QuestionListViewModel.swift
//  QuizApp
//
//  Created by Martin Hegel on 25.01.24.
//

import Foundation

@MainActor
class QuestionListViewModel: ObservableObject {
    
    private var token: String? = nil
    @Published var questions = [Question]()
    @Published var correctAnswer: String = ""
    @Published var answers = [String]()
    @Published var currentQuestion: Question?
    @Published var isFinished = false
    @Published var questionsAmount = [Question]()
    @Published var rightQuestions = [Question]()
    @Published var progress: Double = 0.9
    

    init(selectedAmount: Int, category: String) {
        fetchData(selectedAmount: selectedAmount, category: category)
        
    }

    func fetchData(selectedAmount: Int, category: String) {
        Task {
            do {
                self.questions = try await fetchQuestions(selectedAmount: selectedAmount, category: category)
                self.questionsAmount = questions
                self.currentQuestion = questions.first
                fetchAnswers()
                
                
            } catch {
                print("Request failed with error: \(error)")
            }
        }
    }
    
    private func fetchQuestions(selectedAmount: Int, category: String) async throws -> [Question] {
        self.token = try await fetchToken()
        
        guard let token = self.token, let url = URL(string: "https://opentdb.com/api.php?amount=\(selectedAmount)&category=\(category)&type=multiple&token=\(token)") else {
            throw HTTPError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        print(data)
        
        let result = try JSONDecoder().decode(QuestionResult.self, from: data)
        print(result)
        
        return result.results
    }

    private func fetchToken() async throws -> String {
        
        guard let url = URL(string: "https://opentdb.com/api_token.php?command=request") else {
            throw HTTPError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        print(data)
        
        let result = try JSONDecoder().decode(Token.self, from: data)
        print(result)
        
        return result.token
    }
    
    
    private func fetchAnswers() {
        guard let currentQuestion = currentQuestion else {
            return
        }
        correctAnswer = currentQuestion.correct_answer
        answers.append(currentQuestion.correct_answer)
        answers.append(contentsOf: currentQuestion.incorrect_answers)
        answers.shuffle()
    }
    
    func nextQuestion() {
        if questions.isEmpty {
            return
        } else {
            questions.remove(at: 0)
            self.currentQuestion = questions.first
            answers.removeAll()
            fetchAnswers()
            
        }
    }
    
    func endGame() {
        
        if questions.count <= 1 {
            
           isFinished = true
        print(progressNumber())
          
        } else {
            
            nextQuestion()
            
        }
        
    }
    
    func progressNumber() -> Double {
        return Double(rightQuestions.count) / Double(questionsAmount.count)
    }
    

    
}
