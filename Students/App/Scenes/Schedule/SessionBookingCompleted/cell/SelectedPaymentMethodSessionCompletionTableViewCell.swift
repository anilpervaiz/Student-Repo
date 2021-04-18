//
//  SelectedPaymentMethodSessionCompletionTableViewCell.swift
//  Students
//
//  Created by Rahim on 18/04/2021.
//

import UIKit

class SelectedPaymentMethodSessionCompletionTableViewCell: UITableViewCell,
                                                           ReusableView {

    @IBOutlet weak var paymentMethodImageView: UIImageView!
    @IBOutlet weak var paymentTypeLabel: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()

        paymentMethodImageView.image = nil
        paymentTypeLabel.text = ""
    }

    func configure(viewModel: SelectedPaymentMethodSessionCompletionTableCellViewModel) {
        paymentMethodImageView.image = viewModel.paymentMethod.type.icon.image
        paymentTypeLabel.text = viewModel.paymentMethod.type.title
    }
}

struct SelectedPaymentMethodSessionCompletionTableCellViewModel: TableCellViewModel {
    var paymentMethod: PaymentMethod
}
