//
//  HeadingLabel2.swift
//  Teachers
//

import UIKit

class HeadingLabel2: UILabel {

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    func setupView() {
        textColor = Asset.Colors.darkBlue.color
        font = .init(commonFont: PoppinsFontStyle.semiBold, size: 24)
    }
}
