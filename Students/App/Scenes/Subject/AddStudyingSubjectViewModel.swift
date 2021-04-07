//
//  AddStudyingSubjectViewModel.swift
//  Students
//
//  Created by Rahim on 07/04/2021.
//

import Foundation

class AddStudyingSubjectViewModel {
    var data: [AddSubjectTableCellViewModel] = []

    var numberOfRows: Int {
        data.count
    }

    func setupData() {
        data = Subject.mockData.map {
            AddSubjectTableCellViewModel(subject: $0, isSelected: false)
        }
    }

    func cellViewModel(at index: Int) -> AddSubjectTableCellViewModel {
        data[index]
    }

    func didSelectCell(at index: Int) {
        data[index].isSelected = !data[index].isSelected
    }
}
