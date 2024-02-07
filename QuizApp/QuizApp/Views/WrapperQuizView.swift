//
//  WrapperQuizView.swift
//  QuizApp
//
//  Created by Martin Hegel on 31.01.24.
//

import SwiftUI

struct WrapperQuizView: View {
    
    init(amount: Int = 10, category: String = "") {
        self._questionViewModel = StateObject(wrappedValue: QuestionListViewModel(selectedAmount: amount, category: category))
    }
    
    var body: some View {
        
        if questionViewModel.isFinished == true {
            ResultView()
                .environmentObject(questionViewModel)
            
        } else {
            QuizView()
                .environmentObject(questionViewModel)
            
        }

    }
    
    @StateObject private var questionViewModel: QuestionListViewModel

}

#Preview {
    WrapperQuizView(amount: 1)
}
