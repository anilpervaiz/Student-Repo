//
//  BookSessionRouter.swift
//  Students
//
//  Created by Rahim on 17/04/2021.
//

import Foundation

class BookSessionRouter: BaseRouter {

    func navigateToChatWithTeacher() {
        let viewController = ChatViewController.getInstance()
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }

    func navigateToBookSessionDetails() {
        let viewController = BookSessionViewController.getInstance()
        viewController.viewModel = BookSessionViewModel(router: BookSessionRouter(with: navigationController))
        navigationController?.pushViewController(viewController, animated: true)
    }

    func navigateToAddPaymentMethod() {
        let viewController = AddPaymentMethodViewController.getInstance()
        navigationController?.pushViewController(viewController, animated: true)
    }

    func navigateToConfirmBooking() {
        let viewController = SessionBookingCompletedViewController.getInstance()
        viewController.viewModel = SessionBookingCompletedViewModel()
        viewController.onOperationCompleted = { [weak self] in
            self?.navigationController?.popToRootViewController(animated: true)
        }
        viewController.modalPresentationStyle = .fullScreen

        navigationController?.topViewController?.present(viewController, animated: true, completion: nil)
    }
}
