//
//  UIColor+Image.swift
//  Teachers
//
//  Created by Rahim on 20/03/2021.
//

import UIKit

extension UIColor {
    func image(height: Int = 1) -> UIImage? {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: height))
        if let ctx = UIGraphicsGetCurrentContext() {
            self.setFill()
            ctx.fill(CGRect(x: 0, y: 0, width: 1, height: height))
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return image
        }
        return UIImage()
    }
}
