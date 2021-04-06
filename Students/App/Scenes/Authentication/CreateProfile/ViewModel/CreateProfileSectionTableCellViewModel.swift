//
//  CreateProfileSectionTableCellViewModel.swift
//  Teachers
//
//  Created by Rahim on 20/03/2021.
//

import Foundation

class CreateProfileSectionTableCellViewModel {
    var output: ((Output) -> Void)?

    var isCompleted: Bool = false {
        didSet {
            output?(.updateView)
        }
    }
    var section: ProfileSection

    init(section: ProfileSection) {
        self.section = section
    }

    enum Output {
        case updateView
    }
}
