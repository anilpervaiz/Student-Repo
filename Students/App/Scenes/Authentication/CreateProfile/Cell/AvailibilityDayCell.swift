//
//  AvailibilityDayCell.swift
//  Teachers
//
//  Created by Rahim on 21/03/2021.
//

import UIKit

class AvailibilityDayCell: UICollectionViewCell,
                           ReusableView {

    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        contentView.borderColor = Asset.Colors.lightGray.color
        contentView.cornerRadius = 4
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        titleLabel.text = ""
    }

    func configure(with viewModel: AvailibilityCellViewModel) {
        if viewModel.isSelected {
            contentView.backgroundColor = Asset.Colors.halfBaked.color
            contentView.borderWidth = 0
            titleLabel.textColor = Asset.Colors.pureWhite.color
        } else {
            contentView.backgroundColor = Asset.Colors.pureWhite.color
            contentView.borderWidth = 1
            titleLabel.textColor = Asset.Colors.gray.color
        }
        titleLabel.text = viewModel.title
    }
}
