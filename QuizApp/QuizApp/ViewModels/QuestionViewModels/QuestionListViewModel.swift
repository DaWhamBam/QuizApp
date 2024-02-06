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
    var questions = [Question]()
    @Published var correctAnswer: String = ""
    @Published var answers = [String]()
    @Published var currentQuestion: Question?
    @Published private var selectedTab: TabItem = .home
    @Published var isFinished = false
    @Published var category = ""
    @Published var amountQuestions = "10"
    @Published var amount = ["1", "2", "3"]
    @Published var newQuestion = [Question]()
    
    
    init() {
     // fetchData()
    }

    func fetchData() {
        Task {
            do {
                self.questions = try await fetchQuestions()
                self.currentQuestion = questions.first
                fetchAnswers()
                newQuestion = questions
                
                
            } catch {
                print("Request failed with error: \(error)")
            }
        }
    }
    
    private func fetchQuestions() async throws -> [Question] {
        self.token = try await fetchToken()
        
        guard let token = self.token, let url = URL(string: "https://opentdb.com/api.php?amount=\(amountQuestions)&category=\(category)&type=multiple&token=\(token)") else {
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
        print(currentQuestion)
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
          
        } else {
            
            nextQuestion()
            
        }
        
    }
    
    func printAmount() {
        print(newQuestion)
    }
    
    
}
