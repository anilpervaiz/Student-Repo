//
//  BaseRouter.swift
//  Teachers
//
//  Created by Rahim on 20/03/2021.
//

import Foundation

class BaseRouter {
    weak var navigationController: BaseNavigationController?

    init(with navigationController: BaseNavigationController? = nil) {
        self.navigationController = navigationController
    }
}
