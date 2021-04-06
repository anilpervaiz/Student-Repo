//
//  DateAndTimeTableViewCell.swift
//  Teachers
//

import Foundation
import UIKit

class DateAndTimeTableViewCell: UITableViewCell, ReusableView {
    @IBOutlet weak var timeImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var lectureModeImageView: UIImageView!

    func configure(with viewModel: DateAndTimeTableViewCellViewModel) {
        timeImageView.image = viewModel.timeImage
        dateLabel.text = viewModel.date
        timeLabel.text = viewModel.time
        lectureModeImageView.image = viewModel.lectureModeImage
    }
}

struct DateAndTimeTableViewCellViewModel: SubjectDetailTableCellViewModel {
    let timeImage: UIImage
    let date: String
    let time: String
    let lectureModeImage: UIImage
}
