//
//  LoginRouter.swift
//  Teachers
//
//  Created by Rahim on 24/03/2021.
//

import UIKit

class LoginRouter: BaseRouter {

    var topViewController: UIViewController? {
        navigationController?.topViewController
    }

    func navigateToLoginOptionScreen() {
        let viewController = LoginStateNavigationView()
        viewController.router = LoginRouter(with: navigationController)
        navigationController?.pushViewController(viewController, animated: true)
    }

    func presentProfileRejectedView() {
        let viewController = LoginPendingProcessViewController.getInstance()
        viewController.viewModel = LoginProfileRejectViewModel()

        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .coverVertical

        topViewController?.present(viewController,
                                   animated: true,
                                   completion: nil)
    }

    func presentProfileVerificationPendingView() {
        let viewController = LoginPendingProcessViewController.getInstance()
        viewController.viewModel = LoginAccountWaitingReviewViewModel()

        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .coverVertical

        topViewController?.present(viewController,
                                   animated: true,
                                   completion: nil)
    }

    func navigateToHomeScreen() {
        let viewController = TabbarController.getInstance()
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let window = appDelegate?.window else { return }
        // Animatedly update root view controller
        window.switchRoot(to: viewController)
    }
}
