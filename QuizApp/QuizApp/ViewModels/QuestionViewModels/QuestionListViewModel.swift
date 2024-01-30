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
    @Published  var anwsers = [String]()
    
    
    
    
    init() {
        fetchData()
    }
    
    @Published var currentQuestion: Question?
    
    func fetchData() {
        Task {
            do {
                self.questions = try await fetchQuestions()
                self.currentQuestion = questions.first
            } catch {
                print("Request failed with error: \(error)")
            }
        }
    }
    
    private func fetchQuestions() async throws -> [Question] {
        self.token = try await fetchToken()
        
        guard let token = self.token, let url = URL(string: "https://opentdb.com/api.php?amount=10&token=\(token)") else {
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
}
