//
//  StudentTableViewCell.swift
//  Teachers
//
//  Created by Rahim on 24/03/2021.
//

import UIKit

class StudentTableViewCell: UITableViewCell,
                            ReusableView {
    @IBOutlet weak var studentProfileImage: UIImageView!
    @IBOutlet weak var parentProfileImageView: UIImageView!
    @IBOutlet weak var studentNameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!

    func configure(student: Student) {
        studentProfileImage.image = UIImage(named: student.profileImage)
        studentNameLabel.text = student.name
        parentProfileImageView.image = UIImage(named: student.parent.profileImage)
        ratingLabel.text = "\(student.rating)"
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        studentProfileImage.image = nil
        studentNameLabel.text = ""
        parentProfileImageView.image = nil
        ratingLabel.text = ""
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        studentProfileImage.circular = true
        parentProfileImageView.circular = true
    }
}
