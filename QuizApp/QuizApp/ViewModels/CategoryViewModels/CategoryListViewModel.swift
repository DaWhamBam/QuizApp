import Foundation
import SwiftUI

@MainActor
class CategoryListViewModel: ObservableObject {
    
    @Published var categories = [CategoryViewModel]()
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        Task {
            do {
                self.categories = try await fetchCategories()
                self.categories = splitCategoryNames(categories: self.categories)
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
        
        let result = try JSONDecoder().decode(CategoryResult.self, from: data)
        
        return result.trivia_categories.map { category in
            CategoryViewModel(category: category)
        }
    }
    
    //Big Help from CHATGPT
    private func splitCategoryNames(categories: [CategoryViewModel]) -> [CategoryViewModel] {
        
        return categories.map { categoryViewModel in
            var splittedName = categoryViewModel.name
            splittedName = splittedName.replacingOccurrences(of: "Entertainment:", with: "")
            splittedName = splittedName.replacingOccurrences(of: "Science:", with: "")
            return CategoryViewModel(category: Category(id: categoryViewModel.id, name: splittedName.trimmingCharacters(in: .whitespaces)))
        }
    }
    
}
