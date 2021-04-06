//
//  BottomSheetListCell.swift
//  Teachers
//
//  Created by Rahim on 20/03/2021.
//

import UIKit

class BottomSheetListCell: UITableViewCell,
                           ReusableView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var radioButtonStateImageView: UIImageView!

    override func prepareForReuse() {
        super.prepareForReuse()

        titleLabel.text = ""
        radioButtonStateImageView.image = UIImage()
    }

    func configure(with viewModel: BottomSheetListCellViewModel) {
        titleLabel.text = viewModel.title
        if viewModel.isSelected {
            titleLabel.textColor = Asset.Colors.darkBlue.color
            radioButtonStateImageView.image = Asset.Media.radioButtonSelected.image
        } else {
            titleLabel.textColor = Asset.Colors.gray.color
            radioButtonStateImageView.image = Asset.Media.radioButtonEmpty.image
        }
    }
}
