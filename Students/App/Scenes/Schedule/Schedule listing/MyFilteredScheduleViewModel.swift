//
//  MyFilteredScheduleViewModel.swift
//  Students
//
//  Created by Rahim on 10/04/2021.
//

import Foundation

class MyFilteredScheduleViewModel: MyScheduleViewModel {

    private var allSession: [Session] = Session.mockData
    private var session: [Session] = [] {
        didSet {
            scheduleListingViewModel.updateData(to: session)
        }
    }
    private var selectedSegment: Segment = .upcoming {
        didSet {
            switch selectedSegment {
            case .past: loadPastSessions()
            case .upcoming: loadUpcomingSession()
            }
        }
    }

    override
    init(router: MyScheduleRouter) {
        super.init(router: router)
        loadUpcomingSession()
    }

    func didUpdateSegment(to index: Int) {
        guard let segment = Segment(rawValue: index) else { return }
        selectedSegment = segment
    }

    func loadPastSessions() {
        session = allSession.filter { $0.date < Date() }
    }

    func loadUpcomingSession() {
        session = allSession.filter { $0.date >= Date() }
    }

    override func didTapRequest(at index: Int) {
        if selectedSegment == .upcoming {
            router.navigateToSessionDetail()
        } else {
            router.navigateToPastSessionDetail()
        }
    }

    enum Segment: Int {
        case upcoming
        case past
    }
}
