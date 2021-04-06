//
//  UIView+Autolayout.swift
//  Teachers
//
//  Created by Rahim on 17/03/2021.
//

import UIKit

@objc
extension UIView {
    @discardableResult
    func preparedForAutolayout() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }

    func fillSuperview(edgeInset: UIEdgeInsets = .zero) {
        fillSuperviewVertically(top: edgeInset.top, bottom: edgeInset.bottom)
        fillSuperviewHorizontally(leading: edgeInset.left, trailing: edgeInset.right)
    }

    func fillSuperviewVertically(top: CGFloat = 0, bottom: CGFloat = 0) {
        guard let superview = superview else { return }

        self.topAnchor.constraint(equalTo: superview.topAnchor, constant: top).isActive = true
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -bottom).isActive = true
    }

    func fillSuperviewHorizontally(leading: CGFloat = 0, trailing: CGFloat = 0) {
        guard let superview = superview else { return }

        self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: leading).isActive = true
        self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -trailing).isActive = true
    }
}

extension UIView {
    func centerInParent() {
        centerHorizontallyInParent()
        centerVerticallyInParent()
    }

    func centerHorizontallyInParent() {
        guard let superview = superview else { return }

        self.centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
    }

    func centerVerticallyInParent() {
        guard let superview = superview else { return }

        self.centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
    }

    func overlay(on otherView: UIView) {
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: otherView.topAnchor),
            self.leadingAnchor.constraint(equalTo: otherView.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: otherView.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: otherView.bottomAnchor)
        ])
    }
}
