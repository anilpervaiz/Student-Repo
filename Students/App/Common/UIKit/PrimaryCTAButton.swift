//
//  PrimaryCTAButton.swift
//  Teachers
//
//  Created by Rahim on 16/03/2021.
//

import UIKit

@IBDesignable
class PrimaryCTAButton: UIButton {

    @IBInspectable
    var buttonBackgroundColor: UIColor = Asset.Colors.aquaMarine.color

    @IBInspectable
    var buttonThemeColor: UIColor = Asset.Colors.primary.color

    override func awakeFromNib() {
        super.awakeFromNib()
        setupStyle()
    }

    func setupStyle() {
        titleLabel?.font = .init(commonFont: PoppinsFontStyle.semiBold, size: 14)
        setTitleColor(buttonThemeColor, for: .normal)
        backgroundColor = buttonBackgroundColor
        cornerRadius = 4
        tintColor = buttonThemeColor
    }
}
