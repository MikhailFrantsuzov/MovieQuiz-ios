//
//  QuestionFactoryProtocol.swift
//  MovieQuiz
//
//  Created by Mikhail Frantsuzov on 27.11.2023.
//

import Foundation

protocol QuestionFactoryProtocol {
    var delegate: QuestionFactoryDelegate? {get set}
    func requestNextQuestion()
    func loadData()
}
