//
//  StudentListingSceneBuilder.swift
//  Teachers
//
//  Created by Rahim on 24/03/2021.
//

import Foundation

struct StudentListingSceneBuilder {
    func makeViewController() -> BaseNavigationController {
        let controller = StudentListingViewController.getInstance()
        let navigationController = BaseNavigationController(rootViewController: controller)
        controller.viewModel = StudentListingViewModel(router: StudentListingRouter(with: navigationController))
        return navigationController
    }
}
