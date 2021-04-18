//
//  TeacherProfileViewModel.swift
//  Students
//
//  Created by Rahim on 17/04/2021.
//

import Foundation

class TeacherProfileViewModel {
    var teacher = Teacher.mockData
    var section: [Section] = []
    var router: TeacherListingRouter
    var output: ((Output) -> ())?
    var numberOfSections: Int { section.count }

    init(with router: TeacherListingRouter) {
        self.router = router
        setupData()
    }

    func setupData() {
        section = [
            Section(section: .subjects,
                    isCollapse: false,
                    rows: [TagCollectionTableCellViewModel(tags: ["English", "French"])]),
            Section(section: .biography,
                    isCollapse: false,
                    rows: [
                        TitleWithDescriptionTableCellViewModel(title: "About", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc in facilisi imperdiet nibh tellus maecenas aenean."),
                        TitleWithDescriptionTableCellViewModel(title: "Education",
                                                               description: "UAE University - Department of Languages and Literature"),
                        TitleWithDescriptionTableCellViewModel(title: "Teaching Experience",
                                                               description: "8 Years")
                    ]),
            Section(section: .reviews, isCollapse: true, rows: [
                ReviewTableCellViewModel(review: Review.mockData[0]),
                ReviewTableCellViewModel(review: Review.mockData[1]),
                ReviewTableCellViewModel(review: Review.mockData[2])
            ])
        ]
    }

    func numberOfCell(in sectionIndex: Int) -> Int {
        let selectedSection = section[sectionIndex]
        if selectedSection.isCollapse {
            return 2
        } else {
            return selectedSection.rows.count
        }
    }

    func didSelectRow(at indexPath: IndexPath) {
        var selectedSection = section[indexPath.section]
        switch selectedSection.section {
        case .reviews:
            if selectedSection.isCollapse && indexPath.row == 1 {
                selectedSection.isCollapse = false
                section[indexPath.section] = selectedSection
                output?(.reloadSection(indexPath.section))
            }
        default: return
        }
    }

    func cellViewModel(for indexPath: IndexPath) -> TableCellViewModel {
        return section[indexPath.section].rows[indexPath.row]
    }

    func isExpandableCell(for indexPath: IndexPath) -> Bool {
        return (section[indexPath.section].isCollapse && indexPath.row == 1)
    }

    func didTapChatWithTeacher() {
        router.navigateToChatView()
    }

    func headerDetails(for sectionIndex: Int) -> (String, String) {
        let selectedSection = section[sectionIndex]
        switch selectedSection.section {
        case .reviews: return (selectedSection.section.rawValue, " (\(selectedSection.rows.count))")
        default: return (selectedSection.section.rawValue, "")
        }
    }

    func didTapBookSession() {
        router.navigateToBookSession()
    }

    struct Section {
        var section: TeacherProfileSections
        var isCollapse: Bool
        var rows: [TableCellViewModel]
    }

    enum Output {
        case reloadSection(Int)
    }
}

enum TeacherProfileSections: String {
    case subjects = "Subjects"
    case biography = "Biography"
    case reviews = "Reviews"
}

protocol TableCellViewModel {}
