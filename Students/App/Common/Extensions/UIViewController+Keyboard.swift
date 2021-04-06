//
//  UIView+Keyboard.swift
//  Teachers
//
//  Created by Rahim on 16/03/2021.
//

import UIKit

extension UIViewController {

    @objc func hideKeyboardOnTappingOutsideArea() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                 action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
