//
//  BookSessionViewModel.swift
//  Students
//
//  Created by Rahim on 17/04/2021.
//

import Foundation

class BookSessionDateTimeViewModel {
    var row: [TableCellViewModel] = []
    var router: BookSessionRouter

    var numberOfRows: Int {
        row.count
    }

    init(router: BookSessionRouter) {
        self.router = router
        setupData()
    }

    func setupData() {

        let availibilityCellViewModel = [
            AvailibilityCellViewModel(title: "10:00 AM", isSelected: false),
            AvailibilityCellViewModel(title: "11:00 AM", isSelected: false),
            AvailibilityCellViewModel(title: "12:00 AM", isSelected: false),
            AvailibilityCellViewModel(title: "01:00 AM", isSelected: false),
            AvailibilityCellViewModel(title: "02:00 AM", isSelected: false),
        ]
        row = [
            CalendarTableCellViewModel(),
            AvailibilityHourCollectionTableCellViewModel(hours: availibilityCellViewModel),
            SessionFeesTableViewCellViewModel(hoursValue: "2", totalValue: "50")
        ]
    }

    func cellViewModel(at index: Int) -> TableCellViewModel {
        return row[index]
    }

    func didTapContinueBooking() {
        router.navigateToBookSessionDetails()
    }
}
