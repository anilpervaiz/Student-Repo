//
//  BrowseTeacherViewModel.swift
//  Students
//
//  Created by Rahim on 11/04/2021.
//

import Foundation

class BrowseTeacherViewModel {
    private var data = WishList.mockData
    let subject: Subject?
    private let router: TeacherListingRouter

    var numberOfRows: Int {
        data.count
    }

    init(router: TeacherListingRouter,
         subject: Subject? = nil) {
        self.router = router
        self.subject = subject
    }

    func session(at index: Int) -> WishList {
        data[index]
    }

    func didSelectSession(at index: Int) {
        router.navigateToTeacherProfile(session: data[index])
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
