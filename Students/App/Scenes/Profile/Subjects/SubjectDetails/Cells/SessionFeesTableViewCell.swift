//
//  SessionFeesTableViewCell.swift
//  Teachers

import Foundation
import UIKit

class SessionFeesTableViewCell: UITableViewCell, ReusableView {
    
    @IBOutlet weak var hoursValueLabel: UILabel!
    @IBOutlet weak var totalValueLabel: UILabel!
    
    func configure(with viewModel: SessionFeesTableViewCellViewModel) {        
        hoursValueLabel.text = viewModel.hoursValue
        totalValueLabel.text = viewModel.totalValue
    }
}

struct SessionFeesTableViewCellViewModel: SubjectDetailTableCellViewModel {
    let hoursValue: String
    let totalValue: String
}
