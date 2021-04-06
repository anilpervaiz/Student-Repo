//
//  UILabel+TapGesture.swift
//  Teachers
//
//  Created by Rahim on 15/03/2021.
//

import UIKit

extension UILabel {
    // Check if attributed tappable region is tapped.
    func isTapGesture(_ gesture: UIGestureRecognizer, inRange targetRange: NSRange) -> Bool {
        // Create instances of NSLayoutManager, NSTextContainer and NSTextStorage
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize.zero)
        let textStorage = NSTextStorage(attributedString: attributedText!)

        // Configure layoutManager and textStorage
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)

        // Configure textContainer
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = lineBreakMode
        textContainer.maximumNumberOfLines = numberOfLines
        let labelSize = bounds.size
        textContainer.size = labelSize

        // Find the tapped character location and compare it to the specified range
        let locationOfTouchInLabel = gesture.location(in: self)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)

        let boundingBoxSize = textBoundingBox.size
        let xPoint = (labelSize.width - boundingBoxSize.width) * 0.5 - textBoundingBox.origin.x
        let yPoint = (labelSize.height - boundingBoxSize.height) * 0.5 - textBoundingBox.origin.y
        let textContainerOffset = CGPoint(x: xPoint,
                                          y: yPoint)

        let locationOfTouchInTextContainer = CGPoint(x: locationOfTouchInLabel.x - textContainerOffset.x,
                                                     y: locationOfTouchInLabel.y - textContainerOffset.y)
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer,
                                                            in: textContainer,
                                                            fractionOfDistanceBetweenInsertionPoints: nil)
        return NSLocationInRange(indexOfCharacter, targetRange)
    }
}
