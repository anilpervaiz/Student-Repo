//
//  LinkedAccountRouter.swift
//  Students
//
//  Created by Rahim on 25/04/2021.
//

import Foundation

class LinkedAccountRouter: BaseRouter {
    func navigateToNotificationView() {
        let viewController = NotificationViewController.getInstance()
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }

    func navigateToChatView() {
        let viewController = ChatViewController.getInstance()
        viewController.hidesBottomBarWhenPushed = true
        viewController.viewModel = MockData.chatViewModelWithParentInfo
        navigationController?.pushViewController(viewController, animated: true)
    }

    func navigateToFindByEmail() {
        let viewController = FindLinkedAccountByEmailViewController.getInstance()
        viewController.router = LinkedAccountRouter(with: navigationController)
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }

    func presentSearchedAccountsBottomSheet() {
        let bottomSheet = LinkedAccountSearchedResultViewController.getInstance()
        bottomSheet.linkToMyAccount = {

        }

        bottomSheet.cancelOperation = {

        }
        
        bottomSheet.modalPresentationStyle = .overCurrentContext
        bottomSheet.modalTransitionStyle = .crossDissolve
        navigationController?.tabBarController?.present(bottomSheet,
                                                         animated: true,
                                                         completion: nil)
    }

    func navigateToAddNewAccount() {
        let viewController = NewLinkedAccountPersonalDetailsViewController.getInstance()
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }

    func navigateToLinkedAccountProfile() {
        let viewController = LinkedAccountProfileBuilder().makeViewController(navigationController: navigationController!)
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }

    func navigateToAddAccount() {
        let bottomSheet = SearchLinkedAccountOptionBottomSheet.getInstance()
        bottomSheet.navigateToFindByEmail = { [weak self] in
            self?.navigateToFindByEmail()
        }

        bottomSheet.navigateToAddNewAccount = { [weak self] in
            self?.navigateToAddNewAccount()
        }
        bottomSheet.modalPresentationStyle = .overCurrentContext
        bottomSheet.modalTransitionStyle = .crossDissolve
        navigationController?.tabBarController?.present(bottomSheet,
                                                         animated: true,
                                                         completion: nil)
    }
}
