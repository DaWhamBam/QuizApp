//
//  CategoryViewModel.swift
//  QuizApp
//
//  Created by Martin Hegel on 10.01.24.
//

import Foundation
import SwiftUI

@MainActor
class CategoryListViewModel: ObservableObject {
    
    init() {
        fetchData()
        /*
        ForEach(categories) { categorie in
            categorie.name.split(separator: 15)
        }
         */
    }
    
    @Published var categories = [CategoryViewModel]()
    
    
    func fetchData() {
        Task {
            do {
                self.categories = try await fetchCategories()
            } catch {
                print("Request failed with error: \(error)")
            }
        }
    }
    
    
    
    private func fetchCategories() async throws -> [CategoryViewModel] {
        guard let url = URL(string: "https://opentdb.com/api_category.php") else {
            throw HTTPError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        //print(data)
        
        let result = try JSONDecoder().decode(CategoryResult.self, from: data)
       // print(result)
        
        return result.trivia_categories.map { category in
            CategoryViewModel(category: category)
        }
    }
}
