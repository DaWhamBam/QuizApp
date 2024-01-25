//
//  CircleProgressbar.swift
//  QuizApp
//
//  Created by Martin Hegel on 25.01.24.
//

import SwiftUI

struct CircleProgressbar: View {
    
    let progress: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.pink.opacity(0.5), lineWidth: 30)
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke(Color.pink, style: StrokeStyle(lineWidth: 30, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: progress)
                .shadow(radius: 5)
        }
    }
}

#Preview {
    CircleProgressbar(progress: 0.65)
}
