//
//  DashboardViewModel.swift
//  Teachers
//
//  Created by Rahim on 24/03/2021.
//

import Foundation

class DashboardViewModel {
    var router: DashboardSceneRouter

    init(router: DashboardSceneRouter) {
        self.router = router
    }

    func didTapNotificationButton() {
        router.navigateToNotificationView()
    }

    func didTapChatButton() {
        router.navigateToChatView()
    }
}
