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
    @IBOutlet weak var transactionTypeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        toAccountLabel.text = ""
        amountLabel.text = ""
        dateLabel.text = ""
        transactionTypeLabel.text = ""
    }

    func configure(transaction: Transaction) {
        toAccountLabel.text = "To \(transaction.destinationAccount)"
        amountLabel.text = "\(transaction.amount) AED"
        dateLabel.text = transaction.formattedDate
        transactionTypeLabel.text = transaction.formattedType
    }

}
