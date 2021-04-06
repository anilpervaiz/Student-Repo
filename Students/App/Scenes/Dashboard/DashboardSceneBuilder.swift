//
//  DashboardSceneBuilder.swift
//  Teachers
//
//  Created by Rahim on 24/03/2021.
//

import Foundation

struct DashboardSceneBuilder {
    func makeViewController() -> BaseNavigationController {
        let controller = DashboardViewController.getInstance()

        let navigationController = BaseNavigationController(rootViewController: controller)

        controller.viewModel = DashboardViewModel(router: DashboardSceneRouter(with: navigationController))
        return navigationController
    }
}
