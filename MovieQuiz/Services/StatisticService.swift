//
//  StatisticService.swift
//  MovieQuiz
//
//  Created by Mikhail Frantsuzov on 12.11.2023.
//

import Foundation

final class StatisticServiceImplementation: StatisticService {
    private enum Keys: String {
        case correct, total, bestGame, gamesCount
    }
    
    private let userDefaults = UserDefaults.standard
    var gamesCount: Int {
        get {
            return self.userDefaults.integer(forKey: Keys.gamesCount.rawValue)
        }
        set {
            self.userDefaults.set(newValue, forKey: Keys.gamesCount.rawValue)
        }
    }
    var total: Int {
        get {
            return self.userDefaults.integer(forKey: Keys.total.rawValue)
        }
        set {
            self.userDefaults.set(newValue, forKey: Keys.total.rawValue)
        }
    }
    var correct: Int {
        get {
            return self.userDefaults.integer(forKey: Keys.correct.rawValue)
        }
        set {
            self.userDefaults.set(newValue, forKey: Keys.correct.rawValue)
        }
    }
    var bestGame: BestGame {
        get {
            guard let data = userDefaults.data(forKey: Keys.bestGame.rawValue),
                  let record = try? JSONDecoder().decode(BestGame.self, from: data) else {
                return .init(correct: 0, total: 0, date: Date())
            }
            return record
        }
        set {
            guard let data = try? JSONEncoder().encode(newValue) else {
                print("Невозможно сохранить результат")
                return
            }
            userDefaults.set(data, forKey: Keys.bestGame.rawValue)
        }
    }
    var totalAccuracy: Double {
        get { Double(correct) * 100 / Double(total)
        }
    }
    func store(correct count: Int, total amount: Int) {
        self.correct += count
        self.total += amount
        self.gamesCount += 1
        let bestGame = BestGame(correct: count, total: amount, date: Date())
        if bestGame.isBetterThan(self.bestGame) {
            self.bestGame = bestGame
        }
    }
}
