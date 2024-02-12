//
//  PrimaryButton.swift
//  QuizApp
//
//  Created by Martin Hegel on 12.02.24.
//

import SwiftUI

struct PrimaryButton: View {
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
        }
        .padding(.vertical, 12)
        .background(Color.accentColor)
        .cornerRadius(12)
    }
    
    let title: String
    let action: () -> Void
    
    
}

#Preview {
    PrimaryButton(title: "Login", action: {})
}
