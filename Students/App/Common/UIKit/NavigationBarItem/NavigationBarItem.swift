//
//  NavigationBarItem.swift
//  Teachers
//
//  Created by Rahim on 24/03/2021.
//

import UIKit

class NavigationBarItem: CustomNibView {

    @IBOutlet private weak var badgeView: UIView!
    @IBOutlet private weak var badgeLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet weak var badgeTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewTrailing: NSLayoutConstraint!
    @IBOutlet weak var imageViewTop: NSLayoutConstraint!

    override var tintColor: UIColor! {
        didSet {
            imageView.tintColor = tintColor
        }
    }

    var itemImage: UIImage? = nil {
        didSet {
            imageView?.image = itemImage
        }
    }
    var badgeCount: Int = 0 {
        didSet {
            if badgeCount > 0 {
                badgeLabel?.text = "\(badgeCount)"
                badgeView?.isHidden = false
                badgeTrailingConstraint.constant = 8
                imageViewTrailing.constant = 8
                imageViewTop.constant = 4
            } else {
                badgeLabel?.text = ""
                badgeView?.isHidden = true
                badgeTrailingConstraint.constant = 4
                imageViewTrailing.constant = 4
                imageViewTop.constant = 0
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    override func setupView() {
        imageView.image = itemImage

        if badgeCount > 0 {
            badgeLabel.text = "\(badgeCount)"
            badgeView.isHidden = false
            badgeTrailingConstraint.constant = 8
            imageViewTrailing.constant = 8
            imageViewTop.constant = 4
        } else {
            badgeLabel.text = ""
            badgeView.isHidden = true
            badgeTrailingConstraint.constant = 4
            imageViewTrailing.constant = 4
            imageViewTop.constant = 0
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        badgeView.circular = true
    }
}
