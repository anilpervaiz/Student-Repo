//
//  PaymentMethodTableViewCell.swift
//  Students
//
//  Created by Rahim on 10/04/2021.
//

import UIKit

class PaymentMethodListingTableViewCell: UITableViewCell,
                                         ReusableView {

    @IBOutlet weak var expiryDateLabel: UILabel!
    @IBOutlet weak var isDefaultLabel: UILabel!
    @IBOutlet weak var cardNumberLabel: UILabel!
    @IBOutlet weak var paymentMethodTypeImageView: UIImageView!

    override func prepareForReuse() {
        super.prepareForReuse()

        expiryDateLabel.text = ""
        isDefaultLabel.isHidden = true
        cardNumberLabel.text = ""
        paymentMethodTypeImageView.image = nil
    }

    func configure(with payment: PaymentMethod) {
        isDefaultLabel.isHidden = !payment.isDefault
        cardNumberLabel.text = payment.cardNumber
        paymentMethodTypeImageView.image = payment.type.icon.image
        expiryDateLabel.text = payment.formattedExpiryDate
    }
}
