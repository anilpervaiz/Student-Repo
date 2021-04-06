//
//  SignupAuthenticationDetailsViewController.swift
//  Teachers
//
//  Created by Rahim on 16/03/2021.
//

import UIKit

class SignupAuthenticationDetailsViewController: BaseViewController {

    @IBOutlet weak var passwordTextField: LabelledTextField! {
        didSet {
            passwordTextField.secureEntry = true
            passwordTextField.editTextKeyboardType = .asciiCapable
            passwordTextField.trailingIconStyle = .obscure(switchIcon: Asset.Media.eyeIcon.image,
                                                           secureStateColor: Asset.Colors.gray.color,
                                                           insecureStateColor: Asset.Colors.primary.color)
        }
    }
    @IBOutlet weak var confirmPasswordTextField: LabelledTextField! {
        didSet {
            confirmPasswordTextField.secureEntry = true
            confirmPasswordTextField.editTextKeyboardType = .asciiCapable
            confirmPasswordTextField.trailingIconStyle = .obscure(switchIcon: Asset.Media.eyeIcon.image,
                                                           secureStateColor: Asset.Colors.gray.color,
                                                           insecureStateColor: Asset.Colors.primary.color)
        }
    }
    @IBOutlet weak var emailTextField: LabelledTextField! {
        didSet {
            emailTextField.editTextKeyboardType = .emailAddress
        }
    }
    @IBOutlet weak var ctaButtonBottomConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupKeyboardNotification()
    }
}

extension SignupAuthenticationDetailsViewController {
    func setupKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

// MARK: - Keyboard target events
@objc
extension SignupAuthenticationDetailsViewController {
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

extension SignupAuthenticationDetailsViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .signup }
}
