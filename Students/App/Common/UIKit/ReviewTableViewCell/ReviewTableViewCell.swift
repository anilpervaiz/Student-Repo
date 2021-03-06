//
//  ReviewTableViewCell.swift
//  Teachers
//
//  Created by Rahim on 26/03/2021.
//

import UIKit
import Cosmos
import DateToolsSwift

class ReviewTableViewCell: UITableViewCell,
                           ReusableView {

    @IBOutlet weak var timeAgoLabel: UILabel!
    @IBOutlet weak var starRatingView: CosmosView!
    @IBOutlet weak var reviewedByLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView! {
        didSet {
            profileImageView.cornerRadius = 20
        }
    }
    @IBOutlet weak var reviewLabel: UILabel!

    func configure(with review: Review) {
        timeAgoLabel.text = review.reviewTime.timeAgoSinceNow
        starRatingView.rating = Double(review.rating)
        reviewedByLabel.text = review.reviewedBy.name
        profileImageView.image = UIImage(named:review.reviewedBy.profileImage)
        reviewLabel.text = review.review
    }

    func configure(with viewModel: ReviewTableCellViewModel) {
        timeAgoLabel.text = viewModel.review.reviewTime.timeAgoSinceNow
        starRatingView.rating = Double(viewModel.review.rating)
        reviewedByLabel.text = viewModel.review.reviewedBy.name
        profileImageView.image = UIImage(named:viewModel.review.reviewedBy.profileImage)
        reviewLabel.text = viewModel.review.review
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        timeAgoLabel.text = ""
        starRatingView.rating = 0
        reviewedByLabel.text = ""
        profileImageView.image = nil
        reviewLabel.text = ""
    }
}

struct ReviewTableCellViewModel: TableCellViewModel {
    var review: Review
}
