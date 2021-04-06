//
//  AppDimension.swift
//  Teachers
//
//  Created by Rahim on 16/03/2021.
//

import UIKit

struct AppDimension {
    static let margin = Margin.default
}

extension AppDimension {
    struct Margin {
        static let `default` = Margin()
        private init() { }

        let extraLarge: CGFloat = 30
        let big: CGFloat = 20
        let medium: CGFloat = 16
        let small: CGFloat = 12
        let tiny: CGFloat = 8
    }
}
