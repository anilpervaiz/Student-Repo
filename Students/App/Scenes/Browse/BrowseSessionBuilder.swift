//
//  BrowseSessionBuilder.swift
//  Students
//
//  Created by Rahim on 08/04/2021.
//

import Foundation

struct BrowseSessionBuilder {
    func makeViewController() -> BaseNavigationController {
        let viewController = BrowseSessionViewController.getInstance()
        return BaseNavigationController(rootViewController: viewController)
    }
}
