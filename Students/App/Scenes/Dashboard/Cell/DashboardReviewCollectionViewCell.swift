//
//  DashboardReviewCollectionViewCell.swift
//  Teachers
//
//  Created by Rahim on 24/03/2021.
//

import UIKit
import Cosmos
import DateToolsSwift

class DashboardReviewCollectionViewCell: UICollectionViewCell,
                                         ReusableView {
    
    @IBOutlet weak var timeAgoLabel: UILabel!
    @IBOutlet weak var starRatingView: CosmosView!
    @IBOutlet weak var reviewedByLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var reviewLabel: UILabel!

    func configure(with review: Review) {
        timeAgoLabel.text = review.reviewTime.timeAgoSinceNow
        starRatingView.rating = Double(review.rating)
        reviewedByLabel.text = review.reviewedBy.name
        profileImageView.image = UIImage(named:review.reviewedBy.profileImage)
        reviewLabel.text = review.review
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        timeAgoLabel.text = ""
        starRatingView.rating = 0
        reviewedByLabel.text = ""
        profileImageView.image = nil
        reviewLabel.text = ""
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        profileImageView.circular = true
    }
}
