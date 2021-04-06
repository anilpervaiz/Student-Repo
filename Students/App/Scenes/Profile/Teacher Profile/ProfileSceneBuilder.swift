//
//  ProfileSceneBuilder.swift
//  Teachers
//
//  Created by Rahim on 24/03/2021.
//

import Foundation

struct ProfileSceneBuilder {
    func makeViewController() -> BaseNavigationController {
        let controller = ProfileViewController.getInstance()
        let navigationController = BaseNavigationController(rootViewController: controller)

        controller.router = TeacherProfileRouter(with: navigationController)

        return navigationController
    }
}
