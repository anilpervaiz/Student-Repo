//
//  StudentListingRouter.swift
//  Teachers
//
//  Created by Rahim on 24/03/2021.
//

import Foundation

class StudentListingRouter: BaseRouter {

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

    func navigateToStudentProfile() {
        let viewController = StudentProfileViewController.getInstance()
        viewController.hidesBottomBarWhenPushed = true
        viewController.viewModel = StudentProfileViewModel(router: StudentProfileRouter(with: navigationController))
        navigationController?.pushViewController(viewController, animated: true)
    }
}
