//
//  ScheduleListingRouter.swift
//  Teachers
//
//  Created by Rahim on 28/03/2021.
//

import Foundation

class ProfileScheduleListingRouter: ScheduleListingRouter {
    override func navigateToSessionDetail() {
        let viewController = SubjectMainViewBuilder().makeViewController(navigationController: navigationController)
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }
}

class ScheduleListingRouter: BaseRouter {

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
        let viewController = SessionDetailBuilder().makeViewController(navigationController: navigationController, sessionState: .accepted)
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }

    func didEndedSession() {
        let viewController = SessionEndNoteViewController.getInstance()

        navigationController?.pushViewController(viewController, animated: true)
    }
}
