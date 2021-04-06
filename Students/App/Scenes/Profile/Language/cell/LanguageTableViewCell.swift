//
//  LanguageTableViewCell.swift
//  Teachers
//
//  Created by Rahim on 03/04/2021.
//

import UIKit

class LanguageTableViewCell: UITableViewCell,
                             ReusableView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var stateImageView: UIImageView!

    func configure(viewModel: LanguageTableCellViewModel) {
        titleLabel.text = viewModel.title
        if viewModel.isSelected {
            titleLabel.textColor = Asset.Colors.darkBlue.color
            stateImageView.image = Asset.Media.checkboxSelected.image
        } else {
            titleLabel.textColor = Asset.Colors.gray.color
            stateImageView.image = Asset.Media.checkbox.image
        }
    }
}

struct LanguageTableCellViewModel {
    var title: String
    var isSelected: Bool
}
