//
//  QuizView.swift
//  QuizApp
//
//  Created by Martin Hegel on 23.01.24.
//

import SwiftUI

struct QuizView: View {
    var body: some View {
        NavigationStack {
            VStack {
                
                HStack {
                    
                    HStack {
                        Text("Punkte:")
                            .frame(alignment: .leading)
                            .padding(.leading, 16)
                        
                        Text("124")
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    HStack {
                        Text("Timer:")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        //.padding(.leading, 16)
                        
                        Text("60")
                            .frame(alignment: .trailing)
                            .padding(.trailing, 16)
                    }
                }
                .padding(.top, 16)
                
                ProgressBar()
                    .frame(width: .infinity)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
                
                
                
                Divider()
                    .padding(.bottom, 8)
                
                ZStack {
                    
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(.vertical)
                        .shadow(radius: 4, x: 0, y: 4)
                        .foregroundColor(Color("FourthColor"))
                    
                    Text("Hier steht eine sehr schwere Frage, oder? wie sieht es aus wenn ich mehr Text hier reinschreibe?")
                        .font(.title2)
                        .foregroundStyle(.white)
                        .padding()
                        .fontWidth(.standard)
                        .multilineTextAlignment(.center)
                    
                }
                
                HStack {
                    
                    AnswerButtonLeft(buttonText: "Antwort 1")
                    AnswerButtonRight(buttonText: "Antwort 2")
                }
                
                HStack {
                    
                    AnswerButtonLeft(buttonText: "Antwort 3")
                    AnswerButtonRight(buttonText: "Antwort 4")
                }
                
                
                Button {
                    
                } label: {
                    Text("Prüfen")
                        .bold()
                        .font(.title2)
                        .foregroundStyle(Color.black)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(Color("SecondColor"))
                .cornerRadius(10.0)
                .padding(.horizontal, 16)
                .padding(.bottom, 32)
                .padding(.top, 16)
                .shadow(radius: 4, x: 0, y: 4)
                .onTapGesture(perform: {
                    print("Prüfen")
                })
            }
            .navigationBarTitle("Category", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        
                    } label: {
                        Image(systemName: "x.circle")
                            .bold()
                            .foregroundStyle(Color.black)
                    }
                }
            }
            .background(Color("PrimaryColor"))
        }
        
    }
    
}

#Preview {
    QuizView()
}
