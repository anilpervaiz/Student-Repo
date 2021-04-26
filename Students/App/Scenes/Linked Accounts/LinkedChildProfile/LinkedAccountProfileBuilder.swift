//
//  LinkedAccountProfileBuilder.swift
//  Students
//
//  Created by Rahim on 26/04/2021.
//

import Foundation

struct LinkedAccountProfileBuilder {
    func makeViewController(navigationController: BaseNavigationController) -> BaseViewController {
        let viewController = LinkedChildProfileViewController.getInstance()
        viewController.viewModel = LinkedChildProfileViewModel(router: LinkedChildProfileRouter(with: navigationController))

        return viewController
    }
}
