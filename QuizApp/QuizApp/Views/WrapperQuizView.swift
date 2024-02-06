//
//  WrapperQuizView.swift
//  QuizApp
//
//  Created by Martin Hegel on 31.01.24.
//

import SwiftUI

struct WrapperQuizView: View {
    var body: some View {
        
        if questionViewModel.isFinished == true {
            TaskEditView(questionViewModel: questionViewModel, title: questionViewModel.category)
            
        } else {
            QuizView()
                .environmentObject(questionViewModel)
            
        }

    }
    
    @StateObject var questionViewModel = QuestionListViewModel()
  //  @State var amount: String
    
    @State private var amountSelectedView = ""
    @State var amountListView = ["1", "2", "3"]
    
}

#Preview {
    WrapperQuizView()
}
