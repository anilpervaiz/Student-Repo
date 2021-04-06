//
//  UIFont.swift
//  Teachers
//
//  Created by Rahim on 16/03/2021.
//

import UIKit

enum PoppinsFontStyle: FontStyle {
    case black
    case blackItalic
    case bold
    case boldItalic
    case extraBold
    case extraBoldItalic
    case extraLight
    case extraLightItalic
    case italic
    case light
    case lightItalic
    case medium
    case mediumItalic
    case regular
    case semiBold
    case semiBoldItalic
    case thin
    case thinItalic

    var name: String {
        switch self {
        case .black: return "Poppins-Black"
        case .blackItalic: return "Poppins-BlackItalic"
        case .bold: return "Poppins-Bold"
        case .boldItalic: return "Poppins-BoldItalic"
        case .extraBold: return "Poppins-ExtraBold"
        case .extraBoldItalic: return "Poppins-ExtraBoldItalic"
        case .extraLight: return "Poppins-ExtraLight"
        case .extraLightItalic: return "Poppins-ExtraLightItalic"
        case .italic: return "Poppins-Italic"
        case .light: return "Poppins-Light"
        case .lightItalic: return "Poppins-LightItalic"
        case .medium: return "Poppins-Medium"
        case .mediumItalic: return "Poppins-MediumItalic"
        case .regular: return "Poppins-Regular"
        case .semiBold: return "Poppins-SemiBold"
        case .semiBoldItalic: return "Poppins-SemiBoldItalic"
        case .thin: return "Poppins-Thin"
        case .thinItalic: return "Poppins-ThinItalic"
        }
    }
}

protocol FontStyle {
    var name: String { get }
}

// MARK: - UIFont extension
extension UIFont {
    convenience init(commonFont: FontStyle, size: CGFloat) {
        self.init(name: commonFont.name, size: size)!
    }
}
