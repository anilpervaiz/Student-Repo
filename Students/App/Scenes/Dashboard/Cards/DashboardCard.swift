//
//  DashboardCard.swift
//  Teachers
//
//  Created by Rahim on 24/03/2021.
//

import UIKit

class DashboardCard: CustomNibView {

    var viewModel: DashboardCardViewModel? {
        didSet {
            setupView()
        }
    }

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!

    override func setupView() {
        imageView.image = viewModel?.imageAsset.image
        titleLabel.text = viewModel?.title ?? ""
        descriptionLabel.text = viewModel?.description ?? ""
    }
}

struct DashboardCardViewModel {
    var imageAsset: ImageAsset
    var title: String
    var description: String
}
