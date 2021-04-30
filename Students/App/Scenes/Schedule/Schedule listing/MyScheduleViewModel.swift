//
//  MyScheduleViewModel.swift
//  Students
//
//  Created by Rahim on 10/04/2021.
//

import Foundation

class MyScheduleViewModel {
    lazy var scheduleListingViewModel = {
        return ScheduleListingViewModel(shouldShowSessionState: shouldShowSessionState) { [weak self] index in
            self?.didTapRequest(at: index)
        }
    }()
    var calendarState: CalendarState = .expanded
    var router: MyScheduleRouter
    var shouldShowSessionState: Bool = true {
        didSet {
            scheduleListingViewModel.shouldShowSessionState = shouldShowSessionState
        }
    }

    init(router: MyScheduleRouter) {
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
