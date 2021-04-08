//
//  SwitchTableViewCell.swift
//  Teachers
//
//  Created by Rahim on 28/03/2021.
//

import UIKit

class SwitchTableViewCell: UITableViewCell,
                           ReusableView  {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var switchComponent: UISwitch!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!



    func configure(row: SettingsModel.Row) {
        descriptionLabel.text = ""
        switchComponent.isOn = row.isOn

        titleLabel.text = row.title
        iconImageView.image = row.icon?.image
    }
}
