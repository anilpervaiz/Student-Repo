//
//  RequestListingViewModel.swift
//  Teachers
//
//  Created by Rahim on 25/03/2021.
//

import Foundation

class RequestListingViewModel {
    var router: RequestListingRouter

    init(router: RequestListingRouter) {
        self.router = router
    }

    func didTapNotificationButton() {
        router.navigateToNotificationView()
    }

    func didTapChatButton() {
        router.navigateToChatView()
    }

    func didTapRequest(at index: Int) {
        router.navigateToSessionDetail()
    }
}
