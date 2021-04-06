//
//  RequestListingRouter.swift
//  Teachers
//
//  Created by Rahim on 25/03/2021.
//

import Foundation

class RequestListingRouter: BaseRouter {

    func navigateToNotificationView() {
        let viewController = NotificationViewController.getInstance()
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }

    func navigateToChatView() {
        let viewController = ChatViewController.getInstance()
        viewController.hidesBottomBarWhenPushed = true
        viewController.viewModel = MockData.chatViewModelWithParentInfo
        navigationController?.pushViewController(viewController, animated: true)
    }

    func navigateToSessionDetail() {
        let viewController = SessionDetailBuilder().makeViewController(navigationController: navigationController, sessionState: .requested)
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }
}
