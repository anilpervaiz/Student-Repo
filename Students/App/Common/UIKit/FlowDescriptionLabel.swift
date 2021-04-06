//
//  FlowDescriptionLabel.swift
//  Teachers
//
//  Created by Rahim on 16/03/2021.
//

import UIKit

class FlowDescriptionLabel: UILabel {

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    func setupView() {
        textColor = Asset.Colors.primary.color
        font = .init(commonFont: PoppinsFontStyle.medium, size: 14)
    }
}
