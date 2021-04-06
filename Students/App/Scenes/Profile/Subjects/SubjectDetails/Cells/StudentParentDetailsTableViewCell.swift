//
//  StudentParentDetailsTableViewCell.swift
//  Teachers
//

import Foundation
import UIKit


class StudentParentDetailsTableViewCell: UITableViewCell, ReusableView {
    @IBOutlet weak var studentImageView: UIImageView!
    @IBOutlet weak var parentImageView: UIImageView!
    @IBOutlet weak var studentNameLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    
    private var onChatButtonTapped: (()->())? = nil
    
    override func layoutSubviews() {
        super.layoutSubviews()
        studentImageView.circular = true
        parentImageView.circular = true
        parentImageView.borderWidth = 1.0
        parentImageView.borderColor = Asset.Colors.borderColor.color
    }
    
    func configure(with viewModel: StudentParentDetailsTableViewCellViewModel) {
        studentImageView.image = viewModel.studentImage
        studentNameLabel.text = viewModel.studentName
        parentImageView.image = viewModel.parentImage
        ratingImageView.image = viewModel.ratingImage
        ratingLabel.text = viewModel.rating
        self.onChatButtonTapped = viewModel.onChatButtonTapped
    }

    @IBAction func chatButtonTapped(_ sender: Any) {
        onChatButtonTapped?()
    }
}

struct StudentParentDetailsTableViewCellViewModel: SubjectDetailTableCellViewModel {
    let studentImage: UIImage
    let studentName: String
    let parentImage: UIImage
    let ratingImage: UIImage
    let rating: String
    let onChatButtonTapped: (()->())?
}
