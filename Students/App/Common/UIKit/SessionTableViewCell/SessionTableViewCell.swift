//
//  RequestListingTableViewCell.swift
//  Teachers
//
//  Created by Rahim on 25/03/2021.
//

import UIKit

class SessionTableViewCell: UITableViewCell,
                            ReusableView {

    @IBOutlet weak var userDetailsView: UIStackView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sessionStateView: UIView!
    @IBOutlet weak var sessionState: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var sessionTimeLabel: UILabel!
    @IBOutlet weak var sessionModeImageView: UIImageView!
    @IBOutlet weak var sessionModeLabel: UILabel!

    func configure(session: Session, hiddenUserDetails: Bool = false, hideSessionStateView: Bool = false) {
        var session = session
        titleLabel.text = "\(session.subject) - \(session.curriculum)"

        profileImageView.image = UIImage(named:session.user.profileImage)
        userNameLabel.text = session.user.name
        sessionModeLabel.text = session.medium.title
        sessionModeImageView.image = session.medium.icon.image
        sessionModeImageView.tintColor = session.medium.themeColor.color
        sessionModeLabel.textColor = session.medium.themeColor.color
        sessionTimeLabel.text = session.sessionDate
        userDetailsView.isHidden = hiddenUserDetails
        sessionStateView.isHidden = hiddenUserDetails || hideSessionStateView

        if session.isUpcoming {
            sessionState.text = "Upcoming"
            sessionState.textColor = Asset.Colors.halfBaked.color
            sessionStateView.backgroundColor = Asset.Colors.lightHalfBaked.color
        } else {
            sessionState.text = "Past"
            sessionState.textColor = Asset.Colors.tomatoRed.color
            sessionStateView.backgroundColor = Asset.Colors.tomatoRedLight.color
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.text = ""
        sessionState.text = ""
        sessionState.textColor = .clear
        sessionStateView.backgroundColor = .clear
        profileImageView.image = nil
        userNameLabel.text = ""
        sessionModeLabel.text = ""
        sessionModeImageView.image = nil
        sessionModeLabel.textColor = .clear
        sessionTimeLabel.text = ""
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        sessionStateView.circular = true
        profileImageView.circular = true
    }
}
