//
//  FilterDropdownCollectionViewCell.swift
//  Students
//
//  Created by Rahim on 28/04/2021.
//

import UIKit

class FilterDropdownCollectionViewCell: UICollectionViewCell,
                                        ReusableView {
    
    @IBOutlet weak var dropDownArrow: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    func configure(filter: SessionFilter) {
        contentView.cornerRadius = 16
        contentView.borderColor = Asset.Colors.disableGray.color
        if filter.isSelected {
            contentView.backgroundColor = Asset.Colors.halfBaked.color
            contentView.borderWidth = 0
            titleLabel.textColor = Asset.Colors.pureWhite.color
        } else {
            contentView.backgroundColor = Asset.Colors.pureWhite.color
            contentView.borderWidth = 1
            titleLabel.textColor = Asset.Colors.gray.color
        }
        titleLabel.text = filter.title
        dropDownArrow.isHidden = !filter.isNavigatable
    }
}
