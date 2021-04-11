//
//  BrowseTeacherRouter.swift
//  Students
//
//  Created by Rahim on 11/04/2021.
//

import Foundation

class BrowseTeacherRouter: BaseRouter {
    func navigateToNotificationView() {
        let viewController = NotificationViewController.getInstance()
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }

    func navigateToChatView() {

        let viewController = MessagesListViewController.getInstance()
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }

    func navigateToFilterTeacherListing() {
        let viewController = FilterTeachersViewController.getInstance()
        let navigationController = BaseNavigationController(rootViewController: viewController)
        let router = FilterTeacherRouter(with: navigationController)
        let viewModel = FilterTeacherViewModel(router: router)
        viewController.viewModel = viewModel
        viewController.onFilterSelected = { [weak self] in
            self?.navigateToFilteredTeacherListing()
        }
        self.navigationController?.topViewController?.present(navigationController, animated: true, completion: nil)
    }

    func navigateToFilteredTeacherListing() {
        let viewController = FilteredTeachersViewController.getInstance()

        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }
}
