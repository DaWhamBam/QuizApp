//
//  QuestionListViewModel.swift
//  QuizApp
//
//  Created by Martin Hegel on 25.01.24.
//

import Foundation

@MainActor
class QuestionListViewModel: ObservableObject {
    
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
        guard let url = URL(string: "") else {
            throw HTTPError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let result = try JSONDecoder().decode(QuestionResult.self, from: data)
        
        return result.results.map { question in
            QuestionViewModel(question: question)
        }
    }
    
    
}
