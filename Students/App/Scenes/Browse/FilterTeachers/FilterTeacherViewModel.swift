//
//  FilterTeacherViewModel.swift
//  Students
//
//  Created by Rahim on 11/04/2021.
//

import Foundation

class FilterTeacherViewModel {

    var sections = FilterSection.allCases
    var data: [FilterSection: [FilterTeacherTableCellViewModelType]] = [:]
    var router: FilterTeacherRouter

    init(router: FilterTeacherRouter) {
        self.router = router
        setupData()
    }

    func setupData() {
        for section in sections {
            data[section] = section.rows.map({ row -> FilterTeacherTableCellViewModelType in
                switch row {
                case .titleWithSwitch: return FilterTeacherSwitchTableCellViewModel(row: row)
                case .radioButton: return FilterTeacherRadioButtonCellViewModel(row: row)
                case .dropdown(let option): return FilterTeacherDropdownTableCellViewModel(row: row) {
                    switch option {
                    case .curriculum: self.didTapCurriculum()
                    case .grade: self.didTapGrade()
                    case .location: self.didTapLocation()
                    case .subject: self.didTapSubject()
                    }
                }
                case .optionSelection: return FilterTeacherOptionSelectionViewModel(row: row)
                case .range: return FilterTeacherRangeTableCellViewModel(row: row)
                }
            })
        }
    }

    var numberOfSection: Int {
        sections.count
    }

    func numberOfRows(in section: Int) -> Int {
        sections[section].rows.count
    }

    func title(at index: Int) -> String {
        sections[index].rawValue
    }

    func didTapCurriculum() {
        router.presentRadioButtonBottomSheet(title: "Select Curriculum", items: [
            BottomSheetListCellViewModel(isSelected: false, title: "Math - American Curriculum"),
            BottomSheetListCellViewModel(isSelected: false, title: "Physics - British Curriculum"),
            BottomSheetListCellViewModel(isSelected: true, title: "History - British Curriculum"),
        ]) { [weak self] selected in
            (self?.data[.subject]![0] as? FilterTeacherDropdownTableCellViewModel)?.value = selected ?? ""
        }
    }

    func didTapGrade() {

        router.presentRadioButtonBottomSheet(title: "Select Grade", items: [
            BottomSheetListCellViewModel(isSelected: false, title: "Grade 1"),
            BottomSheetListCellViewModel(isSelected: false, title: "Grade 2"),
            BottomSheetListCellViewModel(isSelected: true, title: "Grade 3"),
        ]) { [weak self] selected in
            (self?.data[.subject]![1] as? FilterTeacherDropdownTableCellViewModel)?.value = selected ?? ""
        }
    }

    func didTapLocation() {

    }

    func didTapSubject() {
        router.presentRadioButtonBottomSheet(title: "Select Subject", items: [
            BottomSheetListCellViewModel(isSelected: false, title: "School A"),
            BottomSheetListCellViewModel(isSelected: false, title: "School B"),
            BottomSheetListCellViewModel(isSelected: true, title: "School C"),
        ]) { [weak self] selected in
            (self?.data[.subject]![2] as? FilterTeacherDropdownTableCellViewModel)?.value = selected ?? ""
        }
    }

    func row(at indexPath: IndexPath) -> FilterTeacherTableCellViewModelType {
        data[sections[indexPath.section]]![indexPath.row]
    }

    func didSelectRow(at index: IndexPath) {
        let section = FilterSection(with: index.section)
        switch section {
        case .availability:
            (data[.availability]?.first as? FilterTeacherSwitchTableCellViewModel)?.toggle()
        case .sortOptions:
            let rows = data[.sortOptions] as? [FilterTeacherRadioButtonCellViewModel]
            for row in rows ?? [] {
                row.isOn = false
            }

            (data[.sortOptions]![index.row] as? FilterTeacherRadioButtonCellViewModel)?.isOn = true
        case .gender:
            let rows = data[.gender] as? [FilterTeacherRadioButtonCellViewModel]
            for row in rows ?? [] {
                row.isOn = false
            }

            (data[.gender]![index.row] as? FilterTeacherRadioButtonCellViewModel)?.isOn = true
        default: break
        }
    }
}

enum FilterSection: String,
                    CaseIterable {
    case availability = "Availability"
    case sortOptions = "Sort Options"
    case gender = "Gender"
    case subject = "Subject"
    case sessionType = "Session Type"
    case location = "Location"
    case budget = "Budget"

    init?(with index: Int) {
        switch index {
        case 0: self = .availability
        case 1: self = .sortOptions
        case 2: self = .gender
        case 3: self = .subject
        case 4: self = .sessionType
        case 5: self = .location
        case 6: self = .budget
        default: return nil
        }
    }

    var rows: [FilterRows<SessionOption>] {
        switch self {
        case .availability: return [.titleWithSwitch("Available Today", false)]
        case .sortOptions: return [
            .radioButton("Star Rating (Higest first)", false),
            .radioButton("Star Rating (Lowest first)", false),
            .radioButton("Most Reviewed First", false),
            .radioButton("Price (lowest first)", false),
            .radioButton("Price (higest first)", false)
        ]
        case .gender:
            return [
                .radioButton("All", true),
                .radioButton("Male", false),
                .radioButton("Female", false)
            ]
        case .subject:
            return [
                .dropdown(.curriculum),
                .dropdown(.grade),
                .dropdown(.subject)
            ]
        case .sessionType:
            return [
                .optionSelection(SessionOption.allCases)
            ]
        case .location:
            return [
                .dropdown(.location)
            ]
        case .budget:
            return [
                .range(("From", ""), ("To", ""))
            ]
        }
    }
}

enum FilterRows<T: OptionCaseIterable> {
    case titleWithSwitch(String, Bool)
    case radioButton(String, Bool)
    case dropdown(FilterDropDown)
    case optionSelection([T])
    case range((String, String), (String, String))
}

enum FilterDropDown {
    case curriculum
    case grade
    case subject
    case location

    var placeholder: String {
        switch self {
        case .curriculum: return "Select Curriculum"
        case .grade: return "Select Grade"
        case .subject: return "Select Subject"
        case .location: return "Location"
        }
    }
}

enum SessionOption: String,
                   OptionCaseIterable {
    case online = "Online"
    case inperson = "In-Person"

    var title: String {
        switch self {
        case .online: return "Online"
        case .inperson: return "In-Person"
        }
    }

    var imageName: String {
        switch self {
        case .online: return Asset.Media.sessionTypeOnline.name
        case .inperson: return Asset.Media.inpersonIcon.name
        }
    }
}
