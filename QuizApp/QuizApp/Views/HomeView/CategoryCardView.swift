//
//  CategoryCardView.swift
//  QuizApp
//
//  Created by Martin Hegel on 10.01.24.
//

import SwiftUI

struct CategoryCardView: View {
    var body: some View {
        ZStack {
            
            VStack {
                Text(categoryViewModel.name)
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding(.leading, 40)
                    .padding(.top, 60)
            }
            .padding(16)
            
            .frame(maxWidth: .infinity, maxHeight: 150)
            .background(Color("FourthColor"))
            .cornerRadius(10.0)
            .shadow(radius: 5, x: 0, y: 4)
            
            Image(categoriePicture())
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .offset(x: -30, y: -50)
            
        }
    }
    
    @ObservedObject var categoryViewModel: CategoryViewModel
    
    func categoriePicture() -> String {
        if categoryViewModel.name == "General Knowledge" {
            return "ca_generalKnowledge"
        } else if categoryViewModel.name == "Books" {
            return "ca_books"
        } else if categoryViewModel.name == "Film" {
            return "ca_movie"
        } else if categoryViewModel.name == "Music" {
            return "ca_music"
        } else if categoryViewModel.name == "Musicals & Theatres" {
            return "ca_musical"
        } else if categoryViewModel.name == "Television" {
            return "ca_television"
        } else if categoryViewModel.name == "Video Games" {
            return "ca_games"
        } else if categoryViewModel.name == "Board Games" {
            return "ca_boardGames"
        } else if categoryViewModel.name == "Science & Nature" {
            return "ca_biology"
        } else if categoryViewModel.name == "Computers" {
            return "ca_computers"
        } else if categoryViewModel.name == "Mathematics" {
            return "ca_mathematics"
        } else if categoryViewModel.name == "Mythology" {
            return "ca_mythology"
        } else if categoryViewModel.name == "Sports" {
            return "ca_sport"
        } else if categoryViewModel.name == "Geography" {
            return "ca_geographie"
        } else if categoryViewModel.name == "History" {
            return "ca_history"
        } else if categoryViewModel.name == "Politics" {
            return "ca_politics"
        } else if categoryViewModel.name == "Art" {
            return "ca_art"
        } else if categoryViewModel.name == "Celebrities" {
            return "ca_celebreties"
        } else if categoryViewModel.name == "Animals" {
            return "ca_animals"
        } else if categoryViewModel.name == "Vehicles" {
            return "ca_vehicles"
        } else if categoryViewModel.name == "Comics" {
            return "ca_comics"
        } else if categoryViewModel.name == "Gadgets" {
            return "ca_gadgets"
        } else if categoryViewModel.name == "Japanese Anime & Manga" {
            return "ca_anime"
        } else if categoryViewModel.name == "Cartoon & Animations" {
            return "ca_cartoon"
        } else {
            return "ca_books"
        }
    }
    
}

#Preview {
    CategoryCardView(categoryViewModel: CategoryViewModel(category: Category(id: 12, name: "Books")))
}
