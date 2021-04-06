//
//  ScheduleListingViewModel.swift
//  Teachers
//
//  Created by Rahim on 28/03/2021.
//

import Foundation

class ScheduleListingViewModel {
    var router: ScheduleListingRouter
    var calendarState: CalendarState = .expanded
    
    init(router: ScheduleListingRouter) {
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

    enum CalendarState {
        case expanded
        case collapsed
    }
}
