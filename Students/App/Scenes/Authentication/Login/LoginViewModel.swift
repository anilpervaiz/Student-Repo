//
//  LoginViewModel.swift
//  Teachers
//
//  Created by Rahim on 24/03/2021.
//

import Foundation

class LoginViewModel {
    var router: LoginRouter

    init(router: LoginRouter) {
        self.router = router
    }

    func userVerificationFailed() {
        router.presentProfileRejectedView()
    }

    func userVerificationPending() {
        router.presentProfileVerificationPendingView()
    }

    func userLoggedInSuccessfully() {
        router.navigateToHomeScreen()
    }

    func didTapLoginButton() {
        router.navigateToLoginOptionScreen()
    }
}
