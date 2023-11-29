//
//  MovieQuizViewControllerProtocol.swift
//  MovieQuiz
//
//  Created by Mikhail Frantsuzov on 29.11.2023.
//

import Foundation

protocol MovieQuizViewControllerProtocol: AnyObject {
    
    func showQuestion(quiz step: QuizStepViewModel)
    func showLoadingIndicator()
    func showFinalAlert(quiz result: QuizResultsViewModel)
    func showErrorAlert(alertModel: AlertModel)
    func hideLoadingIndicator()
    func highlightImageBorder(isCorrectAnswer: Bool)
    func switchOfButtons()
}
