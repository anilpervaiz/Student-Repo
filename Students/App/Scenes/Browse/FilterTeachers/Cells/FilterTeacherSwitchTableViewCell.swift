//
//  FilterTeacherSwitchTableViewCell.swift
//  Students
//
//  Created by Rahim on 11/04/2021.
//

import UIKit

class FilterTeacherSwitchTableViewCell: UITableViewCell,
                                        ReusableView {

    @IBOutlet weak var `switch`: UISwitch!
    @IBOutlet weak var titleLabel: UILabel!
    var viewModel: FilterTeacherSwitchTableCellViewModel?

    func configure(viewModel: FilterTeacherSwitchTableCellViewModel) {
        self.viewModel = viewModel
        if case let .titleWithSwitch(title, isOn) = viewModel.row {
            `switch`.isOn = isOn
            titleLabel.text = title
        }

        viewModel.updateState = { [weak self] in
            self?.`switch`.isOn = viewModel.isOn
        }
    }
}
