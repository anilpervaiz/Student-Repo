//
//  StudentListingViewModel.swift
//  Teachers
//
//  Created by Rahim on 24/03/2021.
//

import Foundation

class StudentListingViewModel {
    var router: StudentListingRouter

    init(router: StudentListingRouter) {
        self.router = router
    }

    func didTapNotificationButton() {
        router.navigateToNotificationView()
    }

    func didTapChatButton() {
        router.navigateToChatView()
    }

    func didTapSeachButton() {
    }

    func didTapStudent(at index: Int) {
        router.navigateToStudentProfile()
    }
}
