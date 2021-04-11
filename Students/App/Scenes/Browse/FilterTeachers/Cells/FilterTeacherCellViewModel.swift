//
//  FilterTeacherCellViewModel.swift
//  Students
//
//  Created by Rahim on 11/04/2021.
//

import Foundation

protocol FilterTeacherTableCellViewModelType {
    var row: FilterRows<SessionOption> { get set }
}

class FilterTeacherSwitchTableCellViewModel: FilterTeacherTableCellViewModelType {
    var row: FilterRows<SessionOption>
    var isOn: Bool = false

    var updateState: (() -> ())?
    init(row: FilterRows<SessionOption>) {
        self.row = row
    }

    func toggle() {
        isOn.toggle()
        updateState?()
    }
}

class FilterTeacherRadioButtonCellViewModel: FilterTeacherTableCellViewModelType {
    var row: FilterRows<SessionOption>
    var isOn: Bool = false {
        didSet {
            updateState?()
        }
    }

    var updateState: (() -> ())?

    init(row: FilterRows<SessionOption>) {
        self.row = row
    }
}

class FilterTeacherDropdownTableCellViewModel: FilterTeacherTableCellViewModelType {
    var row: FilterRows<SessionOption>
    var onDropdownTapped: (() -> ())?
    var onValueUpdated: (() -> ())?
    var value: String = "" {
        didSet {
            onValueUpdated?()
        }
    }

    init(row: FilterRows<SessionOption>,
         onDropdownTapped: (() -> ())?) {
        self.row = row
        self.onDropdownTapped = onDropdownTapped
    }
}

class FilterTeacherRangeTableCellViewModel: FilterTeacherTableCellViewModelType {
    var row: FilterRows<SessionOption>

    init(row: FilterRows<SessionOption>) {
        self.row = row
    }
}

class FilterTeacherOptionSelectionViewModel: FilterTeacherTableCellViewModelType {
    var row: FilterRows<SessionOption>

    init(row: FilterRows<SessionOption>) {
        self.row = row
    }
}
