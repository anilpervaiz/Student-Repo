//
//  FilterTeacherRangeTableViewCell.swift
//  Students
//
//  Created by Rahim on 11/04/2021.
//

import UIKit

class FilterTeacherRangeTableViewCell: UITableViewCell,
                                       ReusableView  {

    @IBOutlet weak var toRangeTextField: LabelledTextField!
    @IBOutlet weak var fromRangeTextField: LabelledTextField!

    var viewModel: FilterTeacherRangeTableCellViewModel?

    func configure(viewModel: FilterTeacherRangeTableCellViewModel) {
        self.viewModel = viewModel
        if case let .range(from, to) = viewModel.row {

            fromRangeTextField.placeholderText = from.0
            fromRangeTextField.inputText = from.1

            toRangeTextField.placeholderText = to.0
            toRangeTextField.inputText = to.1
        }
    }
}
