//
//  LinkedAccountSessionCompletedTableViewCell.swift
//  Students
//
//  Created by Rahim on 29/04/2021.
//

import UIKit

class LinkedAccountSessionCompletedTableViewCell: UITableViewCell,
                                                           ReusableView {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()

        profileImageView.image = nil
        nameLabel.text = ""
    }

    func configure(viewModel: LinkedAccountSessionCompletedTableCellViewModel) {
        profileImageView.image = UIImage(named: viewModel.linkedAccount.profileImage)
        nameLabel.text = viewModel.linkedAccount.name
    }
}

struct LinkedAccountSessionCompletedTableCellViewModel: TableCellViewModel {
    var linkedAccount: LinkedAccount
}
