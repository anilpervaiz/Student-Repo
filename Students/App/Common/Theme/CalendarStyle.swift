//
//  CalendarStyle.swift
//  Teachers
//
//  Created by Rahim on 04/04/2021.
//

import Foundation
import FSCalendar

extension FSCalendar {

    var previousPage: Date {
        switch scope {
        case .month:
            return Calendar.current.date(byAdding: .month, value: -1, to: currentPage)!
        case .week:
            return Calendar.current.date(byAdding: .day, value: -7, to: currentPage)!
        default: return currentPage
        }
    }

    var nextPage: Date {
        switch scope {
        case .month:
            return Calendar.current.date(byAdding: .month, value: 1, to: currentPage)!
        case .week:
            return Calendar.current.date(byAdding: .day, value: 7, to: currentPage)!
        default: return currentPage
        }
    }

    func setupStyle() {
        firstWeekday = 1
        headerHeight = 0

        allowsSelection = false
        allowsMultipleSelection = false

        appearance.todayColor = Asset.Colors.primary.color
        appearance.titleTodayColor = Asset.Colors.pureWhite.color

        appearance.weekdayFont = .init(commonFont: PoppinsFontStyle.regular, size: 10)
        appearance.weekdayTextColor = Asset.Colors.gray.color

        appearance.titleDefaultColor = Asset.Colors.darkBlue.color
        appearance.titleFont = .init(commonFont: PoppinsFontStyle.regular, size: 16)
    }
}
