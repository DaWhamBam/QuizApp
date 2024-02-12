//
//  TextButton.swift
//  QuizApp
//
//  Created by Martin Hegel on 12.02.24.
//

import SwiftUI

struct TextButton: View {
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity)
        }
    }
    
    let title: String
    let action: () -> Void
    
}

#Preview {
    TextButton(title: "Log in", action: {})
}
