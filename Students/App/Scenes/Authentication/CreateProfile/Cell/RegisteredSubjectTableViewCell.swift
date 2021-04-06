//
//  RegisteredSubjectTableViewCell.swift
//  Teachers
//
//  Created by Rahim on 21/03/2021.
//

import UIKit

class RegisteredSubjectTableViewCell: UITableViewCell,
                                      ReusableView {

    @IBOutlet weak var subjectIconImageView: UIImageView!
    @IBOutlet weak var subjectNameLabel: UILabel!
    @IBOutlet weak var subjectDescriptionLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!

    func configure(subject: Subject) {
        subjectNameLabel.text = subject.subject
        subjectDescriptionLabel.text = "\(subject.educationType) - \(subject.curriculum)"
        rateLabel.text = "\(subject.rate) AED/h"
    }
}
