//
//  FilterTeacherDropdownTableViewCell.swift
//  Students
//
//  Created by Rahim on 11/04/2021.
//

import UIKit

class FilterTeacherDropdownTableViewCell: UITableViewCell,
                                          ReusableView  {

    @IBOutlet weak var dropdownTextField: LabelledTextField! {
        didSet {
            dropdownTextField.trailingIconStyle = .static(icon: Asset.Media.downArrow.image)
            dropdownTextField.isEditable = false
            dropdownTextField.isTappable = true
            dropdownTextField.onTextFieldTapped = { [weak self] in
                self?.viewModel?.onDropdownTapped?()
            }
        }
    }

    var viewModel: FilterTeacherDropdownTableCellViewModel?

    func configure(viewModel: FilterTeacherDropdownTableCellViewModel) {
        self.viewModel = viewModel
        if case let .dropdown(type) = viewModel.row {

            dropdownTextField.placeholderText = type.placeholder
            dropdownTextField.inputText = viewModel.value
        }

        viewModel.onValueUpdated = { [weak self] in
            self?.dropdownTextField.inputText = viewModel.value
        }
    }
}
