//
//  HeadingLabel.swift
//  Teachers
//
//  Created by Rahim on 16/03/2021.
//

import UIKit

class HeadingLabel: UILabel {

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    func setupView() {
        textColor = Asset.Colors.darkBlue.color
        font = .init(commonFont: PoppinsFontStyle.semiBold, size: 34)
    }
}
