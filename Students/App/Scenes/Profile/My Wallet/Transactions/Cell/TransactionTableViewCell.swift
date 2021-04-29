//
//  TransactionTableViewCell.swift
//  Teachers
//
//  Created by Rahim on 02/04/2021.
//

import UIKit

class TransactionTableViewCell: UITableViewCell,
                                ReusableView {

    @IBOutlet weak var divider: UIView!
    @IBOutlet weak var toAccountLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var transactionDetailLabel: UILabel!
    @IBOutlet weak var transactionPerformerImageView: UIImageView! {
        didSet {
            transactionPerformerImageView.cornerRadius = 9
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        toAccountLabel.text = ""
        amountLabel.text = ""
        dateLabel.text = ""
        transactionDetailLabel.text = ""
        transactionPerformerImageView.image = nil
    }

    func configure(transaction: Transaction) {
        toAccountLabel.text = "To \(transaction.destinationAccount)"
        amountLabel.text = "\(transaction.amount) AED"
        dateLabel.text = transaction.formattedDate
        if AppManager.userType == .parent {
            transactionPerformerImageView.image = UIImage(named: transaction.usedBy.profileImage)
            transactionDetailLabel.text = transaction.usedBy.name
        } else {
            transactionDetailLabel.text = transaction.formattedType
        }
    }
}
