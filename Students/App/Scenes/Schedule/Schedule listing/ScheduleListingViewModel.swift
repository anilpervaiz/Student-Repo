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

    var numberOfItems: Int {
        session.count
    }

    init(didSelectRow: ((Int) -> Void)?) {
        self.didSelectRow = didSelectRow
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
