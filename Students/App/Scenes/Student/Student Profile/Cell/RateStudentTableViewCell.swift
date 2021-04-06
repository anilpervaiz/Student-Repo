//
//  RateStudentTableViewCell.swift
//  Teachers
//
//  Created by Rahim on 27/03/2021.
//

import UIKit
import Cosmos

class RateStudentTableViewCell: UITableViewCell,
                                ReusableView {


    @IBOutlet weak var cosmosView: CosmosView!

    override func layoutSubviews() {
        super.layoutSubviews()

        let width = UIScreen.main.bounds.width - 48
        let margin = (width - (28 * 5)) / 4
        cosmosView.settings.starMargin = Double(margin)
    }

}
