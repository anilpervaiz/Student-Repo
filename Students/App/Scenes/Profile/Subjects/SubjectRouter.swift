//
//  SubjectRouter.swift
//  Teachers
//

import Foundation

class SubjectRouter: BaseRouter {
    func navigateToChatView() {
        let viewController = ChatViewController.getInstance()
        viewController.hidesBottomBarWhenPushed = true
        viewController.viewModel = MockData.chatViewModelWithoutParentInfo
        navigationController?.pushViewController(viewController, animated: true)
    }

    func navigateToAddNewDocument() {
        let viewController = AddDocumentViewController.getInstance()
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func navigateToWriteAReview() {
        let viewController = RateAndReviewBuilder().makeViewController()
        navigationController?.topViewController?.present(viewController, animated: true, completion: nil)
    }
}
