//
//  SessionFeesTableViewCell.swift
//  Teachers

import Foundation
import UIKit

class SessionFeesTableViewCell: UITableViewCell, ReusableView {
    
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var hoursValueLabel: UILabel!
    @IBOutlet weak var totalValueLabel: UILabel!
    @IBOutlet weak var sessionFeesTitleLabel: UILabel!
    
    func configure(with viewModel: SessionFeesTableViewCellViewModel) {        
        hoursValueLabel.text = viewModel.hoursValue
        totalValueLabel.text = viewModel.totalValue
    }
}

struct SessionFeesTableViewCellViewModel: SubjectDetailTableCellViewModel,
                                          TableCellViewModel {
    let hoursValue: String
    let totalValue: String
}
