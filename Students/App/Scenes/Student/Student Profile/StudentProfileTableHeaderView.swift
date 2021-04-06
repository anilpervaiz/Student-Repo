//
//  StudentProfileTableHeaderView.swift
//  Teachers
//
//  Created by Rahim on 26/03/2021.
//

import UIKit

class StudentProfileTableHeaderView: CustomNibView {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var learningHoursLabel: UILabel!
    @IBOutlet weak var sessionCountLabel: UILabel!

    private var onChatWithStudentTapped: (()->())? = nil
    
    func configure(with student: Student, onChatWithStudentTapped: (()->())? = nil) {
        profileImageView.image = UIImage(named: student.profileImage)
        nameLabel.text = student.name
        ratingLabel.text = "\(student.rating)"
        learningHoursLabel.text = "\(student.learningHours)"
        sessionCountLabel.text = "\(student.sessionCount)"
        self.onChatWithStudentTapped = onChatWithStudentTapped
    }
    
    @IBAction func chatWithStudentButtonTapped(_ sender: Any) {
        onChatWithStudentTapped?()
    }
}
