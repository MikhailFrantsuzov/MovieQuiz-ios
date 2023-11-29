//
//  BestGame.swift
//  MovieQuiz
//
//  Created by Mikhail Frantsuzov on 12.11.2023.
//

import Foundation

struct BestGame: Codable {
    let correct: Int
    let total: Int
    let date: Date
    
    func isBetterThan(_ another: BestGame) -> Bool {
        correct > another.correct
    }
}
