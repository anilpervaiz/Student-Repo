//
//  NumberVerificationViewController.swift
//  Teachers
//
//  Created by Rahim on 17/03/2021.
//

import UIKit
import SVPinView

class NumberVerificationViewController: BaseViewController {

    var viewModel: NumberVerificationViewModel!

    @IBOutlet weak var resentCodeTimerLabel: UILabel!
    @IBOutlet weak var resentCodeButton: SecondaryCTAButton!

    @IBOutlet weak var ctaButtonBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var pinView: SVPinView! {
        didSet {
            pinView.style = .box
            pinView.font = .init(commonFont: PoppinsFontStyle.semiBold, size: 20)
            pinView.keyboardType = .phonePad
            pinView.becomeFirstResponderAtIndex = 0
            pinView.placeholder = "00000"
            pinView.tintColor = .clear
            pinView.becomeFirstResponderAtIndex = nil
            
            pinView.didFinishCallback = { pin in
                print("Here's your pin")
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupKeyboardNotification()
        bindViewModel()
        viewModel.viewDidLoad()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.viewWillDisappear()
    }

    func bindViewModel() {
        viewModel.output = { [weak self] output in
            switch output {
            case .canResentOTP(let canResent):
                self?.setupResentCodeStyle(canResent: canResent)
            case .updateCodeExpireTimer(let timerString):
                self?.resentCodeTimerLabel.text = "Resend in \(timerString)"
            }
        }
    }

    private func setupResentCodeStyle(canResent: Bool) {
        resentCodeButton.isHidden = !canResent
        resentCodeTimerLabel.isHidden = canResent
    }

    @IBAction func didTapResentCodeButton(_ sender: Any) {
        viewModel.didTapOnResendOtpButton()
    }
}

extension NumberVerificationViewController {
    func setupKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

// MARK: - Keyboard target events
@objc
extension NumberVerificationViewController {
    private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
           let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double {
            ctaButtonBottomConstraint.constant = keyboardSize.height + AppDimension.margin.medium
            UIView.animate(withDuration: duration) {
                self.view.layoutIfNeeded()
            }
        }
    }

    private func keyboardWillHide(sender: NSNotification) {
        ctaButtonBottomConstraint.constant = AppDimension.margin.medium
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}

extension NumberVerificationViewController {
    @IBAction func didTapPrimaryCTAButton(_ sender: Any) {
        presentSuccessScreen()
    }

    func presentSuccessScreen() {
        let viewController = SuccessStateViewController.getInstance()

        let viewModel: SuccessStateViewModel
        if self.viewModel.userType == .student {
            viewModel = StudentSignupCompletedSuccessStateViewModel(router: SignupSuccessStateRouter(with: viewController))
        } else {
            viewModel = ParentSignupCompletedSuccessStateViewModel(router: SignupSuccessStateRouter(with: viewController))
        }

        viewController.viewModel = viewModel
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .coverVertical

        self.present(viewController, animated: true, completion: nil)
    }
}

extension NumberVerificationViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .signup }
}
