//
//  LinkedAccountTableViewCell.swift
//  Students
//
//  Created by Rahim on 25/04/2021.
//

import UIKit

class LinkedAccountTableViewCell: UITableViewCell,
                                  ReusableView {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!

    override func prepareForReuse() {
        super.prepareForReuse()

        nameLabel.text = ""
        ratingLabel.text = ""
        profileImageView.image = nil
    }

    func configure(with linkedAccount: LinkedAccount) {
        nameLabel.text = linkedAccount.name
        ratingLabel.text = linkedAccount.rating
        profileImageView.image = UIImage(named: linkedAccount.profileImage)
    }
}
