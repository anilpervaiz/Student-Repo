//
//  PaymentMethodTableViewCell.swift
//  Teachers
//

import Foundation
import UIKit

class PaymentMethodTableViewCell: UITableViewCell, ReusableView {
    @IBOutlet weak var paymentMethodImageView: UIImageView!
    @IBOutlet weak var paymentMethodLabel: UILabel!
    
    func configure(with viewModel: PaymentMethodTableViewCellViewModel) {
        paymentMethodImageView.image = viewModel.paymentMethodImage
        paymentMethodLabel.text = viewModel.paymentMethod
    }
}

struct PaymentMethodTableViewCellViewModel: SubjectDetailTableCellViewModel {
    let paymentMethodImage: UIImage
    let paymentMethod: String
}
