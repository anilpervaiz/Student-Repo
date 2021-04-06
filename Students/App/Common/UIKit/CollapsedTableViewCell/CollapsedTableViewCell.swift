//
//  CollapsedTableViewCell.swift
//  Teachers
//
//  Created by Rahim on 26/03/2021.
//

import UIKit

class CollapsedTableViewCell: UITableViewCell,
                              ReusableView {

    @IBOutlet weak var titleLabel: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()

        titleLabel.text = ""
    }
}
