//
//  RateAndReviewBuilder.swift
//  Teachers
//
//  Created by Rahim on 27/03/2021.
//

import Foundation

struct RateAndReviewBuilder {
    func makeViewController() -> BaseNavigationController {
        let viewController = RateAndReviewViewController.getInstance()
        let navigationController = BaseNavigationController(rootViewController: viewController)

        return navigationController
    }
}
