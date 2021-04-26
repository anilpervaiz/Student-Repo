//
//  LinkedAccountListBuilder.swift
//  Students
//
//  Created by Rahim on 25/04/2021.
//

import Foundation

struct LinkedAccountListBuilder {
    func makeViewController() -> BaseNavigationController {
        let viewController = LinkedAccountListViewController.getInstance()
        let navigationController = BaseNavigationController(rootViewController: viewController)
        let router = LinkedAccountRouter(with: navigationController)
        viewController.viewModel = LinkedAccountListViewModel(router: router)
        return navigationController
    }
}
