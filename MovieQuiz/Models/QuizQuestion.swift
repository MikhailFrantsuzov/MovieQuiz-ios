//
//  QuizQuestion.swift
//  MovieQuiz
//
//  Created by Mikhail Frantsuzov on 02.11.2023.
//

import Foundation

struct QuizQuestion: Equatable {
    let image: Data
    let text: String
    let correctAnswer: Bool
}
