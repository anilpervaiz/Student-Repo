//
//  ProfileCardCollectionViewCell.swift
//  Students
//
//  Created by Rahim on 07/04/2021.
//

import UIKit

class ProfileCardCollectionViewCell: UICollectionViewCell,
                                     ReusableView {

    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    func configure(profileCard: ProfileCards) {
        iconImageView.image = UIImage(named: profileCard.iconName)
        titleLabel.text = profileCard.title
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        iconImageView.image = nil
        titleLabel.text = ""
    }
}
