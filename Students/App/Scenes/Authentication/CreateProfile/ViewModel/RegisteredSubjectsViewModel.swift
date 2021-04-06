//
//  RegisteredSubjectsViewModel.swift
//  Teachers
//
//  Created by Rahim on 21/03/2021.
//

import Foundation

class RegisteredSubjectsViewModel {
    var output: ((Output) -> Void)?
    var numberOfItems: Int {
        subjects.count
    }
    var subjects: [Subject] = [] {
        didSet {
            output?(.reloadData)
        }
    }

    func setupView() {
        if subjects.isEmpty {
            output?(.showEmptyState)
        } else {
            output?(.showNormalState)
        }
    }

    func didAddSubject(subject: Subject) {
        subjects.append(subject)
        setupView()
    }

    func subject(at index: Int) -> Subject {
        subjects[index]
    }

    enum Output {
        case showEmptyState
        case showNormalState
        case reloadData
    }
}
