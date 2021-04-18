//
//  BrowseTeacherViewModel.swift
//  Students
//
//  Created by Rahim on 11/04/2021.
//

import Foundation

class BrowseTeacherViewModel {
    private var data = WishList.mockData
    private let router: TeacherListingRouter

    var numberOfRows: Int {
        data.count
    }

    init(router: TeacherListingRouter) {
        self.router = router
    }

    func session(at index: Int) -> WishList {
        data[index]
    }

    func didSelectSession(at index: Int) {
        router.navigateToTeacherProfile()
    }

    func didTapFilterButton() {
        router.navigateToFilterTeacherListing()
    }

    func didTapNotificationButton() {
        router.navigateToNotificationView()
    }

    func didTapChatButton() {
        router.navigateToChatView()
    }
}
