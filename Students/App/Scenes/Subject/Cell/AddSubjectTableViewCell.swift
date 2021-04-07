//
//  AddSubjectTableViewCell.swift
//  Students
//
//  Created by Rahim on 07/04/2021.
//

import UIKit

class AddSubjectTableViewCell: UITableViewCell,
                               ReusableView {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var stateImageView: UIImageView!

    func configure(viewModel: AddSubjectTableCellViewModel) {
        titleLabel.text = viewModel.subject.subject
        iconImageView.image = UIImage(named: viewModel.subject.iconName)
        if viewModel.isSelected {
            titleLabel.textColor = Asset.Colors.pureWhite.color
            titleLabel.font = .init(commonFont: PoppinsFontStyle.medium, size: 16)
            iconImageView.tintColor = Asset.Colors.pureWhite.color
            stateImageView.image = Asset.Media.checkboxSelected.image
            stateImageView.tintColor = Asset.Colors.pureWhite.color
            contentView.borderWidth = 0
            contentView.backgroundColor = Asset.Colors.halfBaked.color
        } else {
            titleLabel.textColor = Asset.Colors.gray.color
            titleLabel.font = .init(commonFont: PoppinsFontStyle.regular, size: 16)
            iconImageView.tintColor = Asset.Colors.gray.color
            stateImageView.image = Asset.Media.checkbox.image
            contentView.borderWidth = 1
            contentView.backgroundColor = .clear
        }
    }
}

struct AddSubjectTableCellViewModel {
    var subject: Subject
    var isSelected: Bool
}
