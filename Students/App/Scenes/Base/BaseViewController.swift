//
//  BaseViewController.swift
//  Teachers
//
//  Created by Rahim on 16/03/2021.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardOnTappingOutsideArea()
        setBackButtonStyle()
        navigationController?.navigationBar.barStyle = .default
    }

    private func setBackButtonStyle() {

        navigationController?.navigationBar.tintColor = Asset.Colors.gray.color
        let navController = navigationController as? BaseNavigationController
        removeBackButtonTitleOfPushedController()
        navController?.applyCustomBackButtonStyle()
    }

    /// Call this method on the pushing view Controller.
    func removeBackButtonTitleOfPushedController() {
        navigationItem.backBarButtonItem = .empty
    }

    func setLeftAlignNavBarTitle(with title: String,
                                 font: UIFont = .init(commonFont: PoppinsFontStyle.medium, size: 14),
                                 textColor: UIColor = Asset.Colors.gray.color) {
        let label = UILabel()
        label.textColor = textColor
        label.text = title
        label.font = font
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
    }
}
