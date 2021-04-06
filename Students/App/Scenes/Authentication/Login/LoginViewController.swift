//
//  LoginViewController.swift
//  Teachers
//
//  Created by Rahim on 19/03/2021.
//

import UIKit

class LoginViewController: BaseViewController {

    var viewModel: LoginViewModel?
    @IBOutlet weak var emailTextField: LabelledTextField!
    @IBOutlet weak var passwordTextField: LabelledTextField! {
        didSet {
            passwordTextField.secureEntry = true
            passwordTextField.editTextKeyboardType = .asciiCapable
            passwordTextField.trailingIconStyle = .obscure(switchIcon: Asset.Media.eyeIcon.image,
                                                           secureStateColor: Asset.Colors.gray.color,
                                                           insecureStateColor: Asset.Colors.primary.color)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = .default
    }

    @IBAction func didTapFacebookLoginButton(_ sender: Any) {

    }

    @IBAction func didTapLoginButton(_ sender: Any) {
        viewModel?.didTapLoginButton()
    }
}

extension LoginViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .login }
}
