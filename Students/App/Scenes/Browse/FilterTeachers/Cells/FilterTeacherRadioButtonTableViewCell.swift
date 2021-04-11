//
//  FilterTeacherRadioButtonTableViewCell.swift
//  Students
//
//  Created by Rahim on 11/04/2021.
//

import UIKit

class FilterTeacherRadioButtonTableViewCell: UITableViewCell,
                                             ReusableView  {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var radioButtonImageView: UIImageView!

    var viewModel: FilterTeacherRadioButtonCellViewModel?

    func configure(viewModel: FilterTeacherRadioButtonCellViewModel) {
        self.viewModel = viewModel
        if case let .radioButton(title, isOn) = viewModel.row {
            viewModel.isOn = isOn
            titleLabel.text = title
            setupStyle()
        }

        viewModel.updateState = { [weak self] in
            self?.setupStyle()
        }
    }

    func setupStyle() {
        if viewModel?.isOn ?? false {
            titleLabel.textColor = Asset.Colors.darkBlue.color
            radioButtonImageView.image = Asset.Media.radioButtonSelected.image
        } else {
            titleLabel.textColor = Asset.Colors.gray.color
            radioButtonImageView.image = Asset.Media.radioButtonEmpty.image
        }
    }
}
