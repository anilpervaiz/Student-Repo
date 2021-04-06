//
//  AddSubjectViewModel.swift
//  Teachers
//
//  Created by Rahim on 21/03/2021.
//

import Foundation

struct Subject {
    var educationType: String
    var curriculum: String
    var subject: String
    var rate: String
    var documents: [Document]

    static var mockData: [Subject] {
        [
            Subject(educationType: "Grade 6", curriculum: "American Curriculum", subject: "History", rate: "4.0", documents: Document.mockData),
            Subject(educationType: "Grade 6", curriculum: "British Curriculum", subject: "History", rate: "4.0", documents: Document.mockData),
            Subject(educationType: "Grade 7", curriculum: "American Curriculum", subject: "History", rate: "4.0", documents: Document.mockData)
        ]
    }
}

class AddSubjectViewModel {
    var onSubjectSuccessfullyAdded: ((Subject) -> ())?
    var output: ((Output)->Void)?

    init(onSubjectSuccessfullyAdded: ((Subject) -> ())?) {
        self.onSubjectSuccessfullyAdded = onSubjectSuccessfullyAdded
    }

    func updatedRates(to rate: String?) {
        if let rate = rate,
           let double = Double(rate) {
            let total = double + (double * 0.2)
            output?(.updateTotalAmount(amount: "\(total)"))
        }
    }

    func didTapCTAButton(subject: Subject) {
        onSubjectSuccessfullyAdded?(subject)
        output?(.subjectAddedSuccessfully)
    }

    enum Output {
        case updateTotalAmount(amount: String)
        case subjectAddedSuccessfully
    }
}
