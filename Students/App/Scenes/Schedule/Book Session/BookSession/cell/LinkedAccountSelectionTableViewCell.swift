//
//  LinkedAccountSelectionTableViewCell.swift
//  Students
//
//  Created by Rahim on 29/04/2021.
//

import UIKit

class LinkedAccountSelectionTableViewCell: UITableViewCell,
                                           ReusableView {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var radioButtonImageView: UIImageView!

    override func prepareForReuse() {
        super.prepareForReuse()

        setupUnselectedStyle()
    }

    func configure(viewModel: LinkedAccountSelectionTableCellViewModel) {
        if viewModel.isSelected {
            setupSelectedStyle()
        } else {
            setupUnselectedStyle()
        }

        titleLabel.text = viewModel.account.name
        profileImageView.image = UIImage(named: viewModel.account.profileImage)
    }

    func setupSelectedStyle() {
        containerView.backgroundColor = Asset.Colors.halfBaked.color
        containerView.borderColor = Asset.Colors.lightGray.color
        containerView.borderWidth = 0
        titleLabel.font = .init(commonFont: PoppinsFontStyle.medium, size: 16)
        titleLabel.textColor = Asset.Colors.pureWhite.color
        radioButtonImageView.image = Asset.Media.radioButtonSelectedWhite.image
        radioButtonImageView.tintColor = Asset.Colors.pureWhite.color
    }

    func setupUnselectedStyle() {
        containerView.backgroundColor = Asset.Colors.dullWhite.color
        containerView.borderColor = Asset.Colors.lightGray.color
        containerView.borderWidth = 1
        titleLabel.font = .init(commonFont: PoppinsFontStyle.regular, size: 16)
        titleLabel.textColor = Asset.Colors.gray.color
        radioButtonImageView.image = Asset.Media.radioButtonEmpty.image
        radioButtonImageView.tintColor = Asset.Colors.gray.color
    }
}

struct LinkedAccountSelectionTableCellViewModel: TableCellViewModel {
    var account: LinkedAccount
    var isSelected: Bool
}
