//
//  SecondaryCTAButton.swift
//  Teachers
//
//  Created by Rahim on 16/03/2021.
//

import UIKit

@IBDesignable
class SecondaryCTAButton: UIButton {

    @IBInspectable
    var buttonThemeColor: UIColor = Asset.Colors.aquaMarine.color

    override func awakeFromNib() {
        super.awakeFromNib()
        setupStyle()
    }

    func setupStyle() {
        titleLabel?.font = .init(commonFont: PoppinsFontStyle.semiBold, size: 14)
        backgroundColor = .clear
        cornerRadius = 4
        borderWidth = 1
        borderColor = buttonThemeColor
        setTitleColor(buttonThemeColor, for: .normal)
    }
}
