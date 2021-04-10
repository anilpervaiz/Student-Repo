//
//  MyScheduleBuilder.swift
//  Students
//
//  Created by Rahim on 10/04/2021.
//

import Foundation

struct MyScheduleBuilder {
    func makeViewController() -> BaseNavigationController {
        let controller = MyScheduleViewController.getInstance()
        let navigationController = BaseNavigationController(rootViewController: controller)
        controller.viewModel = .init(router: .init(with: navigationController))
        return navigationController
    }
}
