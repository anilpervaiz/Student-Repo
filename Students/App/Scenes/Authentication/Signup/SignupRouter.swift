//
//  SignupRouter.swift
//  Students
//
//  Created by Rahim on 05/04/2021.
//

import Foundation

class SignupRouter: BaseRouter {

    func navigateToSignupPersonalInformation() {
        navigationController?.pushViewController(SignupPersonalInformationViewController.getInstance(),
                                                      animated: true)
    }

    func navigateToSignupMobileNumber() {
        navigationController?.pushViewController(SignupMobileNumberViewController.getInstance(),
                                                 animated: true)
    }

    func navigateToMobileNumberVerification() {
        let viewModel = NumberVerificationViewModel()
        let viewController = NumberVerificationViewController.getInstance()

        viewController.viewModel = viewModel

        navigationController?.pushViewController(viewController, animated: true)
    }

    func navigateToSignupAuthenticationDetails() {
        let viewController = SignupAuthenticationDetailsViewController.getInstance()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
