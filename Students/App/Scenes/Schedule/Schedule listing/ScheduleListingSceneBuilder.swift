//
//  ScheduleListingSceneBuilder.swift
//  Teachers
//
//  Created by Rahim on 24/03/2021.
//

import Foundation

struct ScheduleListingSceneBuilder {
    func makeViewController() -> BaseNavigationController {
        let controller = ScheduleListingViewController.getInstance()
        let navigationController = BaseNavigationController(rootViewController: controller)
        controller.viewModel = .init(router: .init(with: navigationController))
        return navigationController
    }

    func makeProfileSessionsViewController(with navigationController: BaseNavigationController?) -> ScheduleListingViewController {
        let controller = ScheduleListingViewController.getInstance()
        controller.viewModel = .init(router: ProfileScheduleListingRouter(with: navigationController))
        return controller
    }
}
