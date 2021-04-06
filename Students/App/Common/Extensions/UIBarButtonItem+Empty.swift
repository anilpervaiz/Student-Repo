//
//  UIBarButtonItem+Empty.swift
//  Teachers
//
//  Created by Rahim on 16/03/2021.
//

import UIKit

extension UIBarButtonItem {
    static var empty: UIBarButtonItem {
        return UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
