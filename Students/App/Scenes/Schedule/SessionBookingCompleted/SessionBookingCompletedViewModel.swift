//
//  SessionBookingCompletedViewModel.swift
//  Students
//
//  Created by Rahim on 18/04/2021.
//

import Foundation

class SessionBookingCompletedViewModel {
    var row: [TableCellViewModel] = []

    var numberOfRows: Int {
        row.count
    }

    init() {
        setupData()
    }

    func setupData() {
        row = [
            TitleWithDescriptionTableCellViewModel(title: "Reference Number",
                                                   description: "#382991028"),
            PersonDetailsTableViewCellViewModel(
                title: "Teacher",
                personImage: Asset.Media.student.image,
                personName: "Assem Mohammed",
                ratingImage: Asset.Media.ratingStar.image,
                rating: "4.5"),
            SubjectDetailTableViewCellViewModel(
                subjectThumbnailImage: Asset.Media.subject.image,
                subjectName: "History",
                subjectDetail: "American Curriculum - Grade 6"),
            DateAndTimeTableViewCellViewModel(
                timeImage: Asset.Media.time.image,
                date: "Monday, 4 Feb",
                time: "2:30 PM - 01:30 PM (1 hour)",
                lectureModeImage: nil
            ),
            SelectedPaymentMethodSessionCompletionTableCellViewModel(paymentMethod: PaymentMethod.mockData[0]),
            SessionFeesTableViewCellViewModel(hoursValue: "2 hours", totalValue: "AED 80")
        ]
    }

    func cellViewModel(for index: Int) -> TableCellViewModel {
        return row[index]
    }
}
