//
//  ProgressBar.swift
//  QuizApp
//
//  Created by Martin Hegel on 23.01.24.
//

import SwiftUI

struct ProgressBar: View {
    
    @State private var progress = 0.75
    
    
    var body: some View {
        
        VStack {
            ProgressView(value: progress)
                .scaleEffect(x:1, y:4, anchor: .center)
                .progressViewStyle(LinearProgressViewStyle(tint: Color("SecondColor")))
        }
    }
}

#Preview {
    ProgressBar()
}
