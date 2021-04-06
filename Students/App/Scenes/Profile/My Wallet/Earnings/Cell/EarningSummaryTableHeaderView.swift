//
//  EarningSummaryTableViewCell.swift
//  Teachers
//
//  Created by Rahim on 03/04/2021.
//

import UIKit

class EarningSummaryTableHeaderView: CustomNibView {

    @IBOutlet weak var totalEarningImageView: UIImageView!
    @IBOutlet weak var totalEarningDescriptionLabel: UILabel!
    @IBOutlet weak var totalEarningAmountLabel: UILabel!
    @IBOutlet weak var totalEarningTitleLabel: UILabel!

    @IBOutlet weak var amountPendingImageView: UIImageView!
    @IBOutlet weak var amountPendingTitleLabel: UILabel!
    @IBOutlet weak var amountPendingLabel: UILabel!
    @IBOutlet weak var amountPendingDescriptionLabel: UILabel!

    override func setupView() {
        super.setupView()

        amountPendingImageView.image = Asset.Media.earningCollect.image
        amountPendingTitleLabel.text = "You’ll Collect"
        amountPendingLabel.text = "AED 200"
        amountPendingDescriptionLabel.text = "On Friday, 12/02/2021"

        totalEarningImageView.image = Asset.Media.totalEarning.image
        totalEarningTitleLabel.text = "Total Earnings"
        totalEarningAmountLabel.text = "AED 1200"
        totalEarningDescriptionLabel.text = "+ 6% this month"
    }
}
