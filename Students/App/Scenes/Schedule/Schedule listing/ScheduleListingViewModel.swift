//
//  ScheduleListingViewModel.swift
//  Teachers
//
//  Created by Rahim on 28/03/2021.
//

import Foundation

class ScheduleListingViewModel {
    var calendarState: CalendarState = .expanded
    var output: ((Output)->Void)?
    private var didSelectRow: ((Int) -> Void)?
    private var session = Session.mockData
    var shouldShowSessionState: Bool

    var numberOfItems: Int {
        session.count
    }

    init(shouldShowSessionState: Bool = true,
         didSelectRow: ((Int) -> Void)?) {
        self.didSelectRow = didSelectRow
        self.shouldShowSessionState = shouldShowSessionState
    }

    func updateData(to session: [Session]) {
        self.session = session
        output?(.reloadData)
    }

    func getSession(at index: Int) -> Session {
        session[index]
    }

    func didTapRequest(at index: Int) {
        didSelectRow?(index)
    }

    enum CalendarState {
        case expanded
        case collapsed
    }

    enum Output {
        case reloadData
    }
}
