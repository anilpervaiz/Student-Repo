//
//  RequestListingSceneBuilder.swift
//  Teachers
//
//  Created by Rahim on 24/03/2021.
//

import Foundation

struct RequestListingSceneBuilder {
    func makeViewController() -> BaseNavigationController {
        let controller = RequestListingViewController.getInstance()
        let navigationController = BaseNavigationController(rootViewController: controller)
        controller.viewModel = RequestListingViewModel(router: RequestListingRouter(with: navigationController))
        return navigationController
    }
}
