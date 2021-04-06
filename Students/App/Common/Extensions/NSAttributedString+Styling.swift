//
//  NSAttributedString+Styling.swift
//  Teachers
//
//  Created by Rahim on 16/03/2021.
//

import UIKit

extension NSMutableAttributedString {
    /// Description: Apply attute on subString
    /// - Parameters:
    ///   - attribute: NSAttributedString any key
    ///   - range: NSRange
    func apply(attribute: [NSAttributedString.Key: Any], subString: String) {
        if let range = self.string.range(of: subString) {
            self.apply(attribute: attribute, onRange: NSRange(range, in: self.string))
        }
    }

    /// Description: Apply attute on range
    /// - Parameters:
    ///   - attribute: NSAttributedString ay key
    ///   - range: NSRange
    func apply(attribute: [NSAttributedString.Key: Any], onRange range: NSRange) {
        if range.location != NSNotFound {
            self.setAttributes(attribute, range: range)
        }
    }
    /// Apply color on given substring
    /// - Parameters:
    ///   - color: UIColor
    ///   - onRange: color substring
    func apply(color: UIColor, subString: String) {

        if let range = self.string.range(of: subString) {
            self.apply(color: color, onRange: NSRange(range, in: self.string))
        }
    }

    /// Apply color on given range
    /// - Parameters:
    ///   - color: UIColor
    ///   - onRange: color range
    func apply(color: UIColor, onRange: NSRange) {
        self.addAttributes([NSAttributedString.Key.foregroundColor: color],
                           range: onRange)
    }

    /// Apply font on given substring
    /// - Parameters:
    ///   - font: UIFont
    ///   - onRange: font substring
    func apply(font: UIFont, subString: String) {

        if let range = self.string.range(of: subString) {
            self.apply(font: font, onRange: NSRange(range, in: self.string))
        }
    }

    /// Apply link on given range
    /// - Parameters:
    ///   - link: String
    ///   - onRange: link range
    func apply(link: String, onRange: NSRange) {
        self.addAttributes([NSAttributedString.Key.link: link],
                           range: onRange)
    }

    /// Apply link on given substring
    /// - Parameters:
    ///   - link: String
    ///   - onRange: link substring
    func apply(link: String, subString: String) {
        if let range = self.string.range(of: subString) {
            self.apply(link: link, onRange: NSRange(range, in: self.string))
        }
    }

    /// Apply font on given range
    /// - Parameters:
    ///   - font: UIFont
    ///   - onRange: font range
    func apply(font: UIFont, onRange: NSRange) {
        self.addAttributes([NSAttributedString.Key.font: font], range: onRange)
    }

    /// underLine: Underline string on given sustring
    /// - Parameter onRange: underline sustring
    func underLine(subString: String) {
        if let range = self.string.range(of: subString) {
            self.underLine(onRange: NSRange(range, in: self.string))
        }
    }

    /// underLine: Underline string on given range
    /// - Parameter onRange: underline range
    func underLine(onRange: NSRange) {
        self.addAttributes([NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue],
                           range: onRange)
    }

    /// Apply stroke on substring
    /// - Parameters:
    ///   - color: UIColor
    ///   - thickness: stroke width
    ///   - subString: stroke apply to string
    func applyStroke(color: UIColor, thickness: Int, subString: String) {
        if let range = self.string.range(of: subString) {
            self.applyStroke(color: color, thickness: thickness, onRange: NSRange(range, in: self.string))
        }
    }

    /// applyStroke: Apply stroke on give range
    /// - Parameters:
    ///   - color: UIColor
    ///   - thickness: stroke width
    ///   - onRange: stroke range
    func applyStroke(color: UIColor, thickness: Int, onRange: NSRange) {
        self.addAttributes([NSAttributedString.Key.strokeColor: color],
                           range: onRange)
        self.addAttributes([NSAttributedString.Key.strokeWidth: thickness],
                           range: onRange)
    }
}
