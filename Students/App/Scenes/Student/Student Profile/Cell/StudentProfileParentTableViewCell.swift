//
//  StudentProfileParentTableViewCell.swift
//  Teachers
//
//  Created by Rahim on 27/03/2021.
//

import UIKit

class StudentProfileParentTableViewCell: UITableViewCell,
                                         ReusableView {

    @IBOutlet weak var parentNameLabel: UILabel!
    @IBOutlet weak var parentProfileImage: UIImageView!
    var didTapChatButton: (() -> Void)?

    func configure(with parent: User) {
        parentNameLabel.text = parent.name
        parentProfileImage.image = UIImage(named: parent.profileImage)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        parentProfileImage.circular = true
    }

    @IBAction func didTapChatButton(_ sender: Any) {
        didTapChatButton?()
    }
}
