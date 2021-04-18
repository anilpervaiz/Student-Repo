//
//  PaymentMethodSelectionTableViewCell.swift
//  Students
//
//  Created by Rahim on 18/04/2021.
//

import UIKit

class PaymentMethodSelectionTableViewCell: UITableViewCell,
                                           ReusableView {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var methodImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var radioButtonImageView: UIImageView!

    override func prepareForReuse() {
        super.prepareForReuse()

        setupUnselectedStyle()
    }

    func configure(viewModel: PaymentMethodSelectionTableCellViewModel) {
        if viewModel.isSelected {
            setupSelectedStyle()
        } else {
            setupUnselectedStyle()
        }

        titleLabel.text = viewModel.mode.cardNumber
        methodImageView.image = viewModel.mode.type.icon.image
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

struct PaymentMethodSelectionTableCellViewModel: TableCellViewModel {
    var mode: PaymentMethod
    var isSelected: Bool
}
