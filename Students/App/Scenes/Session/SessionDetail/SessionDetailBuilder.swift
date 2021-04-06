//
//  SessionDetailBuilder.swift
//  Teachers
//
//  Created by Rahim on 27/03/2021.
//

import Foundation

struct SessionDetailBuilder {
    func makeViewController(navigationController: BaseNavigationController?,
                            sessionState: Session.State) -> SessionDetailViewController {
        let viewController = SessionDetailViewController.getInstance()
        viewController.viewModel = SessionDetailViewModel(router: SessionDetailRouter(with: navigationController),
                                                          sessionState: sessionState)

        return viewController
    }
}
