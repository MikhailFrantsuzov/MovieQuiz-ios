//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Mikhail Frantsuzov on 27.11.2023.
//

import Foundation

protocol QuestionFactoryDelegate: AnyObject {
    func didReceiveNextQuestion(question: QuizQuestion?)
    func didLoadDataFromServer()
    func didFailToLoadData(with errorMessage: String)
    func didFailToLoadImage()
}
