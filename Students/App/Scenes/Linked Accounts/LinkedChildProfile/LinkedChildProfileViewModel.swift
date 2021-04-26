//
//  LinkedChildProfileViewModel.swift
//  Students
//
//  Created by Rahim on 26/04/2021.
//

import Foundation

class LinkedChildProfileViewModel {
    var router: LinkedChildProfileRouter
    var child = LinkedAccount.mockData.first!

    init(router: LinkedChildProfileRouter) {
        self.router = router
    }

    func didTapSessionRequest(session: Session) {
        router.navigateToSessionDetail(sessionState: session.state)
    }
}
