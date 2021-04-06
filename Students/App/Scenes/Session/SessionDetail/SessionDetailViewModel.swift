//
//  SessionDetailViewModel.swift
//  Teachers
//
//  Created by Rahim on 27/03/2021.
//

import Foundation

class SessionDetailViewModel {
    private let router: SessionDetailRouter

    var session: Session = Session.mockData.first!
    var student: Student = Student.mockData.first!
    var subject: Subject = Subject.mockData.first!
    var sessionState: Session.State

    var output: ((Output) -> Void)?

    init(router: SessionDetailRouter,
         sessionState: Session.State) {
        self.router = router
        self.sessionState = sessionState
    }

    func didTapRejectButton() {
        router.navigateToRejectSessionRequest()
    }

    func didTapStartSessionButton() {
        sessionState = .started
        output?(.reloadData)
    }

    func didTapEndSessionButton() {
        router.navigteToSessionEndFlow()
    }

    func didTapChatButton() {
        router.navigateToChatView()
    }

    enum Output {
        case reloadData
    }
}
