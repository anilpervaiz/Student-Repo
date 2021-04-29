//
//  BookSessionViewModel.swift
//  Students
//
//  Created by Rahim on 18/04/2021.
//

import Foundation

class BookSessionViewModel {
    var section: [Section] = []
    var output: ((Output) -> Void)?
    let router: BookSessionRouter

    var numberOfSections: Int {
        section.count
    }

    init(router: BookSessionRouter) {
        self.router = router
        setupData()
    }

    func numberOfRows(in sectionIndex: Int) -> Int {
        section[sectionIndex].rows.count
    }

    func setupData() {
        section = [
            Section(type: .teacherInfo,
                    rows: [
                PersonDetailsTableViewCellViewModel(
                    title: "Teacher",
                    personImage: Asset.Media.student.image,
                    personName: "Assem Mohammed",
                    ratingImage: Asset.Media.ratingStar.image,
                    rating: "4.5") { [weak self] in
                    self?.router.navigateToChatWithTeacher()
                }
            ]),
            Section(type: .subject,
                    rows: [
                SubjectDetailTableViewCellViewModel(
                    subjectThumbnailImage: Asset.Media.subject.image,
                    subjectName: "History",
                    subjectDetail: "American Curriculum - Grade 6")
            ]),
            Section(type: .dateAndTime,
                    rows: [
                DateAndTimeTableViewCellViewModel(
                    timeImage: Asset.Media.time.image,
                    date: "Monday, 4 Feb",
                    time: "2:30 PM - 01:30 PM (1 hour)",
                    lectureModeImage: nil
                )
            ]),
            Section(type: .sessionType,
                    title: "Session Type",
                rows: [
                OptionSelectionRowViewModel(row: .optionSelection(
                    SessionOption.allCases
                ))
            ]),
            Section(type: .paymentMethod,
                    title: "Payment Method",
                rows: [
                PaymentMethodSelectionTableCellViewModel(mode: PaymentMethod.mockData[0], isSelected: true),
                PaymentMethodSelectionTableCellViewModel(mode: PaymentMethod.mockData[1], isSelected: false),
                AddPaymentMethodTableCellViewModel()
            ]),
            Section(type: .sessionFees,
                    rows: [
                SessionFeesTableViewCellViewModel(hoursValue: "2 hours", totalValue: "AED 80")
            ])
        ]

        if AppManager.userType == .parent {
            let paymentIndex = section.firstIndex { $0.type == .paymentMethod }
            guard let index = paymentIndex else { return }
            section.insert(Section(type: .linkedAccount, title: "Children", rows: [
                LinkedAccountSelectionTableCellViewModel(account: .mockData[0], isSelected: false),
                LinkedAccountSelectionTableCellViewModel(account: .mockData[1], isSelected: false)
            ]), at: index)
        }

    }

    func sectionHeader(for sectionIndex: Int) -> String? {
        section[sectionIndex].title
    }

    func cellViewModel(at index: IndexPath) -> TableCellViewModel {
        section[index.section].rows[index.row]
    }

    func isOptionSelectionSection(at index: Int) -> Bool {
        section[index].type == .sessionType
    }

    func didSelectRow(at indexPath: IndexPath) {
        let selectionSection = section[indexPath.section]

        if selectionSection.type == .paymentMethod {
            // This means add payment method row
            if indexPath.row == selectionSection.rows.count - 1 {
                // Perform add payment method navigation
                router.navigateToAddPaymentMethod()
            } else {
                for index in 0..<selectionSection.rows.count {
                    if var cellViewModel = selectionSection.rows[index] as? PaymentMethodSelectionTableCellViewModel {
                        cellViewModel.isSelected = false
                        section[indexPath.section].rows[index] = cellViewModel
                    }
                }
                if var cellViewModel = section[indexPath.section].rows[indexPath.row] as? PaymentMethodSelectionTableCellViewModel {
                    cellViewModel.isSelected = true
                    section[indexPath.section].rows[indexPath.row] = cellViewModel
                }
                output? (.reloadSection(indexPath.section))
            }
        }

        if selectionSection.type == .linkedAccount {

            for index in 0..<selectionSection.rows.count {
                if var cellViewModel = selectionSection.rows[index] as? LinkedAccountSelectionTableCellViewModel {
                    cellViewModel.isSelected = false
                    section[indexPath.section].rows[index] = cellViewModel
                }
            }
            if var cellViewModel = section[indexPath.section].rows[indexPath.row] as? LinkedAccountSelectionTableCellViewModel {
                cellViewModel.isSelected = true
                section[indexPath.section].rows[indexPath.row] = cellViewModel
            }
            output? (.reloadSection(indexPath.section))
        }

    }

    func didTapConfirmBooking() {
        router.navigateToConfirmBooking()
    }

    enum Output {
        case reloadSection(Int)
    }

    struct Section {
        var type: SectionType
        var title: String?
        var rows: [TableCellViewModel]
    }

    enum SectionType {
        case teacherInfo
        case subject
        case dateAndTime
        case sessionType
        case linkedAccount
        case paymentMethod
        case sessionFees
    }
}
