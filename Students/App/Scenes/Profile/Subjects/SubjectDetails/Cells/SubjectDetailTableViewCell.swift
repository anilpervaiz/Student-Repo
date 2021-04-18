//
//  SubjectDetailTableViewCell.swift
//  Teachers
//

import Foundation
import UIKit

class SubjectDetailTableViewCell: UITableViewCell, ReusableView {
    @IBOutlet weak var subjectThumbnailImageView: UIImageView!
    @IBOutlet weak var subjectNameLabel: UILabel!
    @IBOutlet weak var subjectDetailLabel: UILabel!
    
    func configure(with viewModel: SubjectDetailTableViewCellViewModel) {
        subjectThumbnailImageView.image = viewModel.subjectThumbnailImage
        subjectNameLabel.text = viewModel.subjectName
        subjectDetailLabel.text = viewModel.subjectDetail
    }
}

struct SubjectDetailTableViewCellViewModel: SubjectDetailTableCellViewModel,
                                            TableCellViewModel {
    let subjectThumbnailImage: UIImage
    let subjectName: String
    let subjectDetail: String
}
