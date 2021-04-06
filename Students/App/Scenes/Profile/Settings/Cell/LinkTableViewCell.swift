//
//  LinkTableViewCell.swift
//  Teachers
//
//  Created by Rahim on 28/03/2021.
//

import UIKit

class LinkTableViewCell: UITableViewCell,
                         ReusableView {

    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var leadingImageView: UIView!

    func configure(row: SettingsModel.Row) {
        if let icon = row.icon {
            iconImageView.image = icon.image
            leadingImageView.isHidden = false
        } else {
            leadingImageView.isHidden = true
        }

        titleLabel.text = row.title
        subtitleLabel.text = row.subtitle
    }
}
