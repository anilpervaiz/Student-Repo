//
//  CreateProfileSectionTableViewCell.swift
//  Teachers
//
//  Created by Rahim on 20/03/2021.
//

import UIKit

class CreateProfileSectionTableViewCell: UITableViewCell,
                                         ReusableView {

    @IBOutlet weak var statusImageView: UIImageView!
    @IBOutlet weak var subDescriptionLabel: UILabel!
    @IBOutlet weak var sectionTitleLabel: UILabel!

    var viewModel: CreateProfileSectionTableCellViewModel?

    override func prepareForReuse() {
        super.prepareForReuse()

        subDescriptionLabel.isHidden = true
        subDescriptionLabel.text = ""
        statusImageView.image = UIImage()
        sectionTitleLabel.text = ""
    }

    func configureView(viewModel: CreateProfileSectionTableCellViewModel) {

        self.viewModel = viewModel
        setupView()
        viewModel.output = { [weak self] output in
            switch output {
            case .updateView:
                self?.setupView()
            }
        }
    }

    func setupView() {
        sectionTitleLabel.text = viewModel?.section.title ?? ""
        if viewModel?.section.optional ?? false {
            subDescriptionLabel.text = "Optional"
            subDescriptionLabel.isHidden = false
        } else {
            subDescriptionLabel.text = ""
            subDescriptionLabel.isHidden = true
        }
        contentView.cornerRadius = 4

        if viewModel?.isCompleted ?? false {
            contentView.backgroundColor = Asset.Colors.successGreen.color
            statusImageView.image = Asset.Media.checkedCircle.image
            sectionTitleLabel.textColor = Asset.Colors.pureWhite.color
            sectionTitleLabel.font = .init(commonFont: PoppinsFontStyle.medium, size: 16)
        } else {
            contentView.backgroundColor = Asset.Colors.pureWhite.color
            statusImageView.image = Asset.Media.uncheckedCircle.image
            contentView.borderColor = Asset.Colors.lightGray.color
            contentView.borderWidth = 1
            sectionTitleLabel.textColor = Asset.Colors.darkBlue.color
            sectionTitleLabel.font = .init(commonFont: PoppinsFontStyle.regular, size: 16)
        }
    }
}
