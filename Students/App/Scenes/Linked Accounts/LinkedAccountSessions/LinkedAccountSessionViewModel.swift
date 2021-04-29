//
//  LinkedAccountSessionViewModel.swift
//  Students
//
//  Created by Rahim on 28/04/2021.
//

import Foundation

class LinkedAccountSessionViewModel {
    var filters: [SessionFilter] = []
    var session: [Session] = []
    var output: ((Output) -> Void)?

    init() {
        setupFilters()
        setupSession()
    }

    func setupFilters() {
        filters = [
            SessionFilter(isNavigatable: true, filter: .subjects),
            SessionFilter(isNavigatable: true, filter: .teachers),
            SessionFilter(isNavigatable: false, filter: .upcoming),
            SessionFilter(isNavigatable: false, filter: .past),
        ]
    }

    func setupSession() {
        session = Session.mockData
    }

    func didSelectFilter(at index: Int) {
        let filter = filters[index].filter
        switch filter {
        case .subjects: output?(.showSubjectBottomDrawer)
        default: output?(.reloadFilters)
        }
    }

    func didSelectSubject(title: String) {
        filters[0].title = title
        if title == filters[0].filter.rawValue {
            filters[0].isSelected = false
        } else {
            filters[0].isSelected = true
        }
        output?(.reloadFilters)
    }

    enum Output {
        case showSubjectBottomDrawer
        case reloadFilters
    }
}

struct SessionFilter {
    enum Filter: String {
        case subjects = "All Subjects"
        case teachers = "All Teachers"
        case upcoming = "Upcoming"
        case past = "Past"
    }

    var title: String
    var isNavigatable: Bool
    var isSelected: Bool
    var filter: Filter

    init(isNavigatable: Bool,
         filter: Filter) {
        self.isNavigatable = isNavigatable
        self.filter = filter
        self.isSelected = false
        self.title = filter.rawValue
    }
}
