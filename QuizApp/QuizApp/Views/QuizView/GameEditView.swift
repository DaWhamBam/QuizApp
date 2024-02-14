//
//  TaskEdidView.swift
//  QuizApp
//
//  Created by Martin Hegel on 05.02.24.
//

import SwiftUI

struct GameEditView: View {

    var body: some View {
        
            VStack {
                
                Text("Custom Quiz")
                    .font(.title)
                    .bold()
                    .padding()
                    .padding(.bottom, 50)
                    
                Divider()
                
                HStack {
                    
                    Text("Category:")
                    
                    Text(category)
                        .font(.title2)
                        .bold()
                        .foregroundStyle(.black)
                    
                }
                
                HStack {
                    
                    Text("Questions:")
                        .font(.body)
                    
                    Picker("test", selection: $amountSelected) {
                        ForEach(amountOptions, id: \.self) {
                            Text("\($0)")
                                .tag($0)
                        }
                    }
                    .pickerStyle(.menu)
                    .tint(.blue)
                    .bold()
                    .font(.title2)
                    
                }
                
                HStack {
                    
                    Text("Difficulty:")
                        .font(.body)
                    
                    Picker("test", selection: $selectedDifficulty) {
                        ForEach(difficultyOptions, id: \.self) {
                            Text("\($0)")
                                .tag($0)
                        }
                    }
                    .pickerStyle(.menu)
                    .tint(.blue)
                    .bold()
                    .font(.title2)
                    
                }
                
                Divider()
                
                Spacer()
                    
                
                NavigationLink {
                    WrapperQuizView(amount: amountSelected, category: categoryNumber(), difficulty: selectedDifficulty, isPresented: $isPresented)
                } label: {
                    Text("Start Quiz")
                        .font(.title2)
                        .bold()
                        .foregroundStyle(.black)
                }
                .frame(width: 300, height: 50)
                .background(Color("SecondColor"))
                .clipShape(Capsule())
                .shadow(radius: 4, x: 0, y: 4)
                .padding()
                
                
                
                
            }
            .background(Color("MainColor"))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isPresented = false
                        
                    } label: {
                        Image(systemName: "x.circle")
                            .bold()
                            .foregroundStyle(Color.black)
                    }
                    
                }
            }
        
    }
    
    
    @EnvironmentObject var questionViewModel: QuestionListViewModel
    
    @Binding var isPresented: Bool
    
    let category: String
    @State private var amountSelected = 1
    @State private var amountOptions = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50]
    
    @State private var selectedDifficulty = "easy"
    @State private var difficultyOptions = ["easy", "medium", "hard"]
    
    
    
    func categoryNumber() -> String {
        if category == "General Knowledge" {
            return String(9)
        } else if category == "Entertainment: Books" {
            return String(10)
        } else if category == "Entertainment: Film" {
            return String(11)
        } else if category == "Entertainment: Music" {
            return String(12)
        } else if category == "Entertainment: Musicals & Theatres" {
            return String(13)
        } else if category == "Entertainment: Television" {
            return String(14)
        } else if category == "Entertainment: Video Games" {
            return String(15)
        } else if category == "Entertainment: Board Games" {
            return String(16)
        } else if category == "Science & Nature" {
            return String(17)
        } else if category == "Science: Coumputers" {
            return String(18)
        } else if category == "Science: Mathematics" {
            return String(19)
        } else if category == "Mythology" {
            return String(20)
        } else if category == "Sports" {
            return String(21)
        } else if category == "Geography" {
            return String(22)
        } else if category == "History" {
            return String(23)
        } else if category == "Politics" {
            return String(24)
        } else if category == "Art" {
            return String(25)
        } else if category == "Celebrities" {
            return String(26)
        } else if category == "Animals" {
            return String(27)
        } else if category == "Vehicles" {
            return String(28)
        } else if category == "Entertainment: Comics" {
            return String(29)
        } else if category == "Science: Gadgets" {
            return String(30)
        } else if category == "Entertainment: Japanese Anime & Manga" {
            return String(31)
        } else if category == "Entertainment: Cartoon & Animations" {
            return String(32)
        } else {
            return ""
        }
        
        
    }
    


}


#Preview {
    GameEditView(isPresented: .constant(false), category: "Book" )
}
