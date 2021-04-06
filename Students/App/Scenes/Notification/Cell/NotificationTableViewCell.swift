//
//  NotificationTableViewCell.swift
//  Teachers
//
//  Created by Rahim on 24/03/2021.
//

import UIKit

class NotificationTableViewCell: UITableViewCell,
                                 ReusableView {


    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var notificationTimeLabel: UILabel!
    @IBOutlet weak var notificationDescriptionLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!

    override func prepareForReuse() {
        statusView.backgroundColor = .clear
        notificationTimeLabel.text = ""
        notificationDescriptionLabel.attributedText = .none
        profileImageView.image = nil
    }

    func configure(notification: Notification) {
        var notification = notification
        statusView.backgroundColor = notification.status == .new ? Asset.Colors.halfBaked.color : .clear
        notificationTimeLabel.text = notification.timeString

        let attributedString = NSMutableAttributedString(string: notification.user.name,
                                                  attributes: [
            .font: UIFont.init(commonFont: PoppinsFontStyle.medium, size: 16),
            .foregroundColor: Asset.Colors.darkBlue.color
        ])

        let descriptionString = NSAttributedString(string: notification.message,
                                                          attributes: [
                                                            .font: UIFont.init(commonFont: PoppinsFontStyle.regular, size: 16),
                                                            .foregroundColor: Asset.Colors.darkBlue.color
                                                          ])
        attributedString.append(descriptionString)
        notificationDescriptionLabel.attributedText = attributedString
        profileImageView.image = UIImage(named: notification.user.profileImage)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        profileImageView.circular = true
        statusView.circular = true
    }
}
