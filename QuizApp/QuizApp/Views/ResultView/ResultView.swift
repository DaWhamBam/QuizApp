//
//  ResultView.swift
//  QuizApp
//
//  Created by Martin Hegel on 25.01.24.
//

import SwiftUI

struct ResultView: View {
    
    @State var progress: Double = 0
    
    
    var body: some View {
        VStack {
            Image("Pokal")
                .resizable()
                .scaledToFill()
                //.frame()
                
            CircleProgressbar(progress: progress)
                //.frame()
            
            /*
            Button("Reset") {
            resetProgress()
            }
            .buttonStyle(.borderedProminent)
            */
            
            
            
        }
    }
    
    
    
    func resetProgress() {
        progress = 0.36
        }
    
}

#Preview {
    ResultView()
}
