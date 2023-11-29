import UIKit
final class MovieQuizViewController: UIViewController, MovieQuizViewControllerProtocol {
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var textLabel: UILabel!
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var noButton: UIButton!
    @IBOutlet private weak var yesButton: UIButton!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    private var presenter: MovieQuizPresenter!
    private var alertPresenter: AlertPresenter?
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alertPresenter = AlertPresenter(viewController: self)
        presenter = MovieQuizPresenter(viewController: self)
        
        imageView.layer.cornerRadius = 20
        imageView.layer.backgroundColor = UIColor.clear.cgColor
        activityIndicator.hidesWhenStopped = true
        self.switchOfButtons()
    }
    
    // MARK: - Actions
    
    @IBAction private func yesButtonClicked(_ sender: UIButton) {
        self.switchOfButtons()
        presenter.yesButtonClicked()
        yesButton.layer.masksToBounds = true
        yesButton.layer.borderWidth = 4
        yesButton.layer.borderColor = UIColor.ypBackground.cgColor
    }
    
    @IBAction private func noButtonClicked(_ sender: UIButton) {
        self.switchOfButtons()
        presenter.noButtonClicked()
        noButton.layer.masksToBounds = true
        noButton.layer.borderWidth = 4
        noButton.layer.borderColor = UIColor.ypBackground.cgColor
    }
    
    // MARK: - Internal functions
    
    func showQuestion(quiz step: QuizStepViewModel) {
        noButton.layer.borderWidth = 0
        yesButton.layer.borderWidth = 0
        imageView.layer.borderColor = UIColor.clear.cgColor
        imageView.image = step.image
        textLabel.text = step.question
        counterLabel.text = step.questionNumber
        switchOfButtons()
    }
    
    func highlightImageBorder(isCorrectAnswer: Bool) {
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 8
        imageView.layer.borderColor = isCorrectAnswer ? UIColor.ypGreen.cgColor : UIColor.ypRed.cgColor
    }
    
    func showFinalAlert(quiz result: QuizResultsViewModel) {
        let alertModel = AlertModel(
            title: result.title,
            message: result.text,
            buttonText: result.buttonText,
            buttonAction: { [weak self] in
                guard let self = self else { return }
                self.presenter.restartGame()
            }
        )
        alertPresenter?.show(result: alertModel)
    }
    
    func showLoadingIndicator() {
        activityIndicator?.startAnimating()
    }
    
    func hideLoadingIndicator() {
        activityIndicator?.stopAnimating()
    }
    
    func switchOfButtons() {
        yesButton.isEnabled.toggle()
        noButton.isEnabled.toggle()
    }
    
    func showErrorAlert(alertModel: AlertModel) {
        alertPresenter?.show(result: alertModel)
    }
}
