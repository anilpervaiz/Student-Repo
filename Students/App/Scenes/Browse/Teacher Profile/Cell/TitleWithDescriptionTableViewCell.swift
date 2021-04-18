//
//  TitleWithDescriptionTableViewCell.swift
//  Students
//
//  Created by Rahim on 17/04/2021.
//

import UIKit

class TitleWithDescriptionTableViewCell: UITableViewCell,
                                         ReusableView {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!

    func configure(with viewModel: TitleWithDescriptionTableCellViewModel) {
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        titleLabel.text = ""
        descriptionLabel.text = ""
    }
}

struct TitleWithDescriptionTableCellViewModel: TableCellViewModel {
    var title: String
    var description: String
}
