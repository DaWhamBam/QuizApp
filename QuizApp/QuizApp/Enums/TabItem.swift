//
//  TabItem.swift
//  QuizApp
//
//  Created by Martin Hegel on 09.01.24.
//

import Foundation

enum TabItem {
    case home, board, settings
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .board: return "Board"
        case .settings: return "Settings"
        }
    }
    
    var icon: String {
        switch self {
        case .home: return "house"
        case .board: return "flag.2.crossed"
        case .settings: return "gearshape"
        }
    }
}
