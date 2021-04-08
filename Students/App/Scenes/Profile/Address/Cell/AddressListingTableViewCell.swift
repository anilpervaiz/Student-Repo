//
//  AddressListingTableViewCell.swift
//  Students
//
//  Created by Rahim on 08/04/2021.
//

import UIKit

class AddressListingTableViewCell: UITableViewCell,
                                   ReusableView {

    @IBOutlet weak var suiteDetailsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var isDefaultAddressLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()

        suiteDetailsLabel.text = ""
        locationLabel.text = ""
        isDefaultAddressLabel.isHidden = true
        titleLabel.text = ""
    }

    func configure(address: Address) {
        titleLabel.text = address.title
        locationLabel.text = address.address
        suiteDetailsLabel.text = address.description
        isDefaultAddressLabel.isHidden = !address.isDefault
    }
}
