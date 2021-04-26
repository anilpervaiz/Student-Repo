//
//  LinkedChildProfileRouter.swift
//  Students
//
//  Created by Rahim on 26/04/2021.
//

import Foundation

class LinkedChildProfileRouter: BaseRouter {
    func navigateToSessionDetail(sessionState: Session.State) {
        let viewController = SessionDetailBuilder().makeViewController(navigationController: navigationController,
                                                                       sessionState: sessionState)
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }
}
