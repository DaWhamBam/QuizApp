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
    
    
    init() {
        fetchData()
    }
    
    @Published var questions = [QuestionViewModel]()
    
    func fetchData() {
        Task {
            do {
                self.questions = try await fetchQuestions()
            } catch {
                print("Request failed with error: \(error)")
            }
        }
    }
    
    private func fetchQuestions() async throws -> [QuestionViewModel] {
        if let token = self.token {
         //   fetchToken()
        }
        
        guard let token = self.token, let url = URL(string: "https://opentdb.com/api.php?amount=1&token=\(token)") else {
            throw HTTPError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        print(data)
        
        let result = try JSONDecoder().decode(QuestionResult.self, from: data)
        print(result)
        
        return result.results.map { question in
            QuestionViewModel(question: question)
        }
    }
    
    
    
    
}
