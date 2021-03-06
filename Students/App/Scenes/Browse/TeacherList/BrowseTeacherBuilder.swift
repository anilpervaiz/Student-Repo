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

    func makeViewController(subject: Subject, navigationController: BaseNavigationController) -> BrowseSubjectBasedTeacherViewController {
        let viewController = BrowseSubjectBasedTeacherViewController.getInstance()
        let viewModel = BrowseTeacherViewModel(router: TeacherListingRouter(with: navigationController), subject: subject)
        viewController.viewModel = viewModel
        return viewController
    }
}
