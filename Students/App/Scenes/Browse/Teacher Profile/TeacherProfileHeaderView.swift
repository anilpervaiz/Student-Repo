//
//  TeacherProfileHeaderView.swift
//  Students
//
//  Created by Rahim on 16/04/2021.
//

import UIKit

class TeacherProfileHeaderView: CustomNibView {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var learningHoursLabel: UILabel!
    @IBOutlet weak var sessionCountLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!

    private var onChatWithTeacherTapped: (()->())? = nil

    func configure(with teacher: Teacher, onChatWithTeacherTapped: (()->())? = nil) {
        profileImageView.image = UIImage(named: teacher.profileImage)
        nameLabel.text = teacher.name
        ratingLabel.text = "\(teacher.rating)"
        learningHoursLabel.text = "\(teacher.tutoredHour)"
        sessionCountLabel.text = "\(teacher.sessionCount)"
        locationLabel.text = "Dubai - United Arab Emirates"
        self.onChatWithTeacherTapped = onChatWithTeacherTapped
    }

    @IBAction func chatWithTeacherButtonTapped(_ sender: Any) {
        onChatWithTeacherTapped?()
    }

    @IBAction func didTapFavoriteButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
}
