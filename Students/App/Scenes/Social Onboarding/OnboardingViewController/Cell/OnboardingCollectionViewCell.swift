//
//  OnboardingCollectionViewCell.swift
//  Teachers
//
//  Created by Rahim on 18/03/2021.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell,
                                    ReusableView {
    
    @IBOutlet weak var pageImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()

        pageImageView.image = nil
        titleLabel.text = ""
        descriptionLabel.text = ""
    }

    func configure(for page: OnboardingPage) {
        pageImageView.image = UIImage(named: page.imageName)
        titleLabel.text = page.title
        descriptionLabel.text = page.description
    }
}
