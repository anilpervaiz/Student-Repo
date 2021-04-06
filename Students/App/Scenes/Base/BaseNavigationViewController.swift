//
//  BaseNavigationViewController.swift
//  Teachers
//
//  Created by Rahim on 16/03/2021.
//

import UIKit

/// Customized NavigationController based on requirements.
class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        transparent()
        setupTitleStyle()
    }

    func setupTitleStyle() {
        navigationBar.titleTextAttributes = [.foregroundColor: Asset.Colors.gray.color,
                                             .font: UIFont.init(commonFont: PoppinsFontStyle.semiBold, size: 16)]
    }

    func transparent() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        navigationBar.backgroundColor = .clear
        navigationBar.barStyle = .blackTranslucent
    }

    func opaque(with color: UIColor) {
        navigationBar.setBackgroundImage(nil, for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = color
        navigationBar.backgroundColor = color
    }

    func showShadow() {
        self.navigationBar.shadowImage = Asset.Colors.lightGray.color.image()
    }

    /// Call this method on the pushed view Controller
    func applyCustomBackButtonStyle() {
        let backImage = Asset.Media.backArrow.image
        navigationBar.backIndicatorImage = backImage
        navigationBar.backIndicatorTransitionMaskImage = backImage
    }
}
