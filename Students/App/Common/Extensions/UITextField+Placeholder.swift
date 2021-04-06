//
//  UITextField+Placeholder.swift
//  Teachers
//
//  Created by Rahim on 16/03/2021.
//

import UIKit

extension UITextField {
   @IBInspectable var placeHolderColor: UIColor? {
        get {
            let attribute = self.attributedPlaceholder?.attribute(.foregroundColor, at: 0, effectiveRange: nil) as? UIColor

            return attribute
        }
        set {
            var attributes = self.attributedPlaceholder?.attributes(at: 0, effectiveRange: nil) ?? [:]
            attributes[.foregroundColor] = newValue
            let placeholder = self.placeholder != nil ? self.placeholder! : ""
            self.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                            attributes: attributes)
        }
    }

   var placeHolderFont: UIFont? {
        get {
            let attribute = self.attributedPlaceholder?.attribute(.font, at: 0, effectiveRange: nil) as? UIFont
            return attribute
        }
        set {
            var attributes = self.attributedPlaceholder?.attributes(at: 0,
                                                                    effectiveRange: nil) ?? [:]
            attributes[.font] = newValue
            let placeholder = self.placeholder != nil ? self.placeholder! : ""
            self.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                            attributes: attributes)
        }
    }
}
