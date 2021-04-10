//
//  WishlistTableViewCell.swift
//  Students
//
//  Created by Rahim on 10/04/2021.
//

import UIKit

class WishlistTableViewCell: UITableViewCell,
                             ReusableView {

    @IBOutlet weak var studentsCountLabel: UILabel!
    @IBOutlet weak var hoursTutoredLabel: UILabel!
    @IBOutlet weak var teacherRatingLabel: UILabel!
    @IBOutlet weak var subjectLable: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var teacherNameLabel: UILabel!
    @IBOutlet weak var teacherProfileImageView: UIImageView!
    @IBOutlet weak var sessionCostLabel: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()

        studentsCountLabel.text = ""
        hoursTutoredLabel.text = ""
        teacherRatingLabel.text = ""
        subjectLable.text = ""
        locationLabel.text = ""
        teacherNameLabel.text = ""
        teacherProfileImageView.image = nil
        sessionCostLabel.text = ""
    }

    func configure(with wish: WishList) {
        studentsCountLabel.text = "\(wish.teacher.students)"
        hoursTutoredLabel.text = "\(wish.teacher.tutoredHour)"
        teacherRatingLabel.text = "\(wish.teacher.rating)"
        subjectLable.text = wish.teacher.formattedSubjects
        locationLabel.text = "Dubai"
        teacherNameLabel.text = wish.teacher.name
        teacherProfileImageView.image = UIImage(named: wish.teacher.profileImage)
        sessionCostLabel.text = wish.formattedAmount
    }
}
