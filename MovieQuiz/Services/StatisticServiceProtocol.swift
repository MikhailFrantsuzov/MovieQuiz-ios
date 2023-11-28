//
//  StatisticServiceProtocol.swift
//  MovieQuiz
//
//  Created by Mikhail Frantsuzov on 27.11.2023.
//

import Foundation

protocol StatisticService {
    var totalAccuracy: Double { get }
    var gamesCount: Int { get }
    var bestGame: BestGame { get }
    var correct: Int { get }
    var total: Int { get }
    func store(correct count: Int, total amount: Int)
}
