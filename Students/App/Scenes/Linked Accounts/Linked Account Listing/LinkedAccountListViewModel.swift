//
//  LinkedAccountListViewModel.swift
//  Students
//
//  Created by Rahim on 25/04/2021.
//

import Foundation

class LinkedAccountListViewModel {
    let router: LinkedAccountRouter
    private var linkedAccounts: [LinkedAccount] = LinkedAccount.mockData

    var numberOfItems: Int {
        linkedAccounts.count
    }

    init(router: LinkedAccountRouter) {
        self.router = router
    }

    func didTapNotificationButton() {
        router.navigateToNotificationView()
    }

    func didTapAddAccountButton() {
        router.navigateToAddAccount()
    }

    func didTapChatButton() {
        router.navigateToChatView()
    }

    func linkedAccount(at index: Int) -> LinkedAccount {
        linkedAccounts[index]
    }

    func didTapLinkedAccount(at index: Int) {
        router.navigateToLinkedAccountProfile()
    }
}
