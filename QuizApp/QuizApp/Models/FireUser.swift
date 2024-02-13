//
//  FireUser.swift
//  QuizApp
//
//  Created by Martin Hegel on 13.02.24.
//

import Foundation

struct FireUser: Codable {
    var id: String
    var email: String
    var registeredAt: Date
    var points: Int = 0
    var rank: String = "-----"
    var name: String = "User"
}
