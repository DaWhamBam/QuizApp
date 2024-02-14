//
//  WrapperQuizView.swift
//  QuizApp
//
//  Created by Martin Hegel on 31.01.24.
//

import SwiftUI

struct WrapperQuizView: View {
    
    init(amount: Int = 10, category: String = "", difficulty: String = "", isPresented: Binding<Bool>) {
        self._questionViewModel = StateObject(wrappedValue: QuestionListViewModel(selectedAmount: amount, category: category, difficulty: difficulty))
        self._isPresented = isPresented
    }
    
    var body: some View {
        
        if questionViewModel.isFinished == true {
            ResultView(isPresented: $isPresented)
                .environmentObject(questionViewModel)
            
        } else {
            QuizView()
                .environmentObject(questionViewModel)
            
        }

    }
    
    @StateObject private var questionViewModel: QuestionListViewModel
    @Binding var isPresented: Bool

}

#Preview {
    WrapperQuizView(amount: 1, isPresented: .constant(false))
}
