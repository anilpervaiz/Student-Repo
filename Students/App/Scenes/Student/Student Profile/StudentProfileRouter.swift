//
//  StudentProfileRouter.swift
//  Teachers
//
//  Created by Rahim on 27/03/2021.
//

import Foundation

class StudentProfileRouter: BaseRouter {

    func navigateToChat(showsParentInfo: Bool) {
        let viewController = ChatViewController.getInstance()
        viewController.hidesBottomBarWhenPushed = true
        viewController.viewModel = showsParentInfo ? MockData.chatViewModelWithParentInfo : MockData.chatViewModelWithoutParentInfo
        navigationController?.pushViewController(viewController, animated: true)
    }

    func navigateToWriteAReview() {
        let viewController = RateAndReviewBuilder().makeViewController()
        navigationController?.topViewController?.present(viewController, animated: true, completion: nil)
    }
}
