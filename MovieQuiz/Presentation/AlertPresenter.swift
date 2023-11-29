//
//  AlertPresenter.swift
//  MovieQuiz
//
//  Created by Mikhail Frantsuzov on 14.11.2023.
//

import Foundation
import UIKit

final class AlertPresenter {
    private weak var viewController: UIViewController?
    
    init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }
    func show(result: AlertModel) {
        let alert = UIAlertController(
            title: result.title,
            message: result.message,
            preferredStyle: .alert)
        let action = UIAlertAction(
            title: result.buttonText,
            style: .default) { _ in
                result.buttonAction()
            }
        alert.addAction(action)
        alert.view.accessibilityIdentifier = "Result alert"
        viewController?.present(alert, animated: true)
    }
}
