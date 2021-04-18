//
//  BrowseTeacherBuilder.swift
//  Students
//
//  Created by Rahim on 08/04/2021.
//

import Foundation

struct BrowseTeacherBuilder {
    func makeViewController() -> BaseNavigationController {
        let viewController = BrowseTeacherViewController.getInstance()
        let navigationController = BaseNavigationController(rootViewController: viewController)
        let viewModel = BrowseTeacherViewModel(router: TeacherListingRouter(with: navigationController))
        viewController.viewModel = viewModel
        return navigationController
    }
}
