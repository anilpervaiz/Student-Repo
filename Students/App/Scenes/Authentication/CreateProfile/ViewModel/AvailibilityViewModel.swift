//
//  AvailibilityViewModel.swift
//  Teachers
//
//  Created by Rahim on 21/03/2021.
//

import Foundation

class AvailibilityViewModel {

    var days: [AvailibilityCellViewModel]
    var hours: [AvailibilityCellViewModel]

    init() {
        days = Days.allCases.map {
            AvailibilityCellViewModel(title: $0.rawValue, isSelected: false)
        }
        hours = [
            AvailibilityCellViewModel(title: "07:00 AM", isSelected: false),
            AvailibilityCellViewModel(title: "08:00 AM", isSelected: false),
            AvailibilityCellViewModel(title: "09:00 AM", isSelected: false),
            AvailibilityCellViewModel(title: "10:00 AM", isSelected: false),
            AvailibilityCellViewModel(title: "11:00 AM", isSelected: false),
        ]
    }

    func numberOfDays() -> Int { days.count }
    func numberOfHours() -> Int { hours.count }

    func day(at index: Int) -> AvailibilityCellViewModel { days[index] }
    func hour(at index: Int) -> AvailibilityCellViewModel { hours[index] }

    func didSelectDay(at index: Int) {
        for index in 0..<days.count {
            days[index].isSelected = false
        }
        days[index].isSelected = !days[index].isSelected
    }
    func didSelectHour(at index: Int) { hours[index].isSelected = !hours[index].isSelected }
}

enum Days: String, CaseIterable {
    case saturday = "SAT"
    case sunday = "SUN"
    case monday = "MON"
    case tuesday = "TUE"
    case wednesday = "WED"
    case thursday = "THU"
    case friday = "FRI"
}
