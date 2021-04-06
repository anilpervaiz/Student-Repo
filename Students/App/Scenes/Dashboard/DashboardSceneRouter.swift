//
//  DashboardSceneRouter.swift
//  Teachers
//
//  Created by Rahim on 24/03/2021.
//

import Foundation

class DashboardSceneRouter: BaseRouter {
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
}
