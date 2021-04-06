//
//  SessionDetailRouter.swift
//  Teachers
//
//  Created by Rahim on 27/03/2021.
//

import Foundation

class SessionDetailRouter: BaseRouter {
    func navigateToRejectSessionRequest() {
        let viewController = RejectSessionViewController.getInstance()
        navigationController?.pushViewController(viewController, animated: true)
    }

    func navigteToSessionEndFlow() {
        let viewController = SessionEndNoteViewController.getInstance()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func navigateToChatView() {
        let viewController = ChatViewController.getInstance()
        viewController.hidesBottomBarWhenPushed = true
        viewController.viewModel = MockData.chatViewModelWithoutParentInfo
        navigationController?.pushViewController(viewController, animated: true)
    }
}
