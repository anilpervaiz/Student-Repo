//
//  NewPasswordViewController.swift
//  Teachers
//
//  Created by Rahim on 19/03/2021.
//

import UIKit

class NewPasswordViewController: BaseViewController {

    @IBOutlet weak var newPasswordTextField: LabelledTextField! {
        didSet {
            newPasswordTextField.secureEntry = true
            newPasswordTextField.editTextKeyboardType = .asciiCapable
            newPasswordTextField.trailingIconStyle = .obscure(switchIcon: Asset.Media.eyeIcon.image,
                                                           secureStateColor: Asset.Colors.gray.color,
                                                           insecureStateColor: Asset.Colors.primary.color)
        }
    }
    @IBOutlet weak var newConfirmPasswordTextField: LabelledTextField! {
        didSet {
            newConfirmPasswordTextField.secureEntry = true
            newConfirmPasswordTextField.editTextKeyboardType = .asciiCapable
            newConfirmPasswordTextField.trailingIconStyle = .obscure(switchIcon: Asset.Media.eyeIcon.image,
                                                           secureStateColor: Asset.Colors.gray.color,
                                                           insecureStateColor: Asset.Colors.primary.color)
        }
    }

    @IBAction func didTapSavePassword(_ sender: Any) {
        navigationController?.backToViewController(vc: LoginViewController.self)
    }
}
