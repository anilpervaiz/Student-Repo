//
//  PaddedTextField.swift
//  Teachers
//
//  Created by Rahim on 16/03/2021.
//

import UIKit

class PaddedTextField: UITextField {

    var padding = UIEdgeInsets(top: 0, left: AppDimension.margin.medium, bottom: 0, right: AppDimension.margin.medium)

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func selectionRects(for range: UITextRange) -> [UITextSelectionRect] {
        return []
    }

    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.rightViewRect(forBounds: bounds)
        textRect.origin.x -= AppDimension.margin.medium
        return textRect
    }

    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += 10
        return textRect
    }
}
