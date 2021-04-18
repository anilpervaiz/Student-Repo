//
//  FilterTeacherOptionSelectionTableViewCell.swift
//  Students
//
//  Created by Rahim on 11/04/2021.
//

import UIKit

class OptionSelectionTableViewCell: UITableViewCell,
                                    ReusableView {

    lazy var optionSelectionView: OptionSelectionView<SessionOption> = {
        let view = OptionSelectionView<SessionOption>().preparedForAutolayout()
        return view
    }()
    @IBOutlet weak var genderOptionContainerView: UIView! {
        didSet {
            genderOptionContainerView.addSubview(optionSelectionView)
            optionSelectionView.fillSuperview()
        }
    }
    
    var viewModel: OptionSelectionRowViewModel?

    func configure(viewModel: OptionSelectionRowViewModel) {
        self.viewModel = viewModel
        if case let .optionSelection(options) = viewModel.row {
            optionSelectionView.configure(with: options, title: "")
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        optionSelectionView.configure(with: [], title: "")
    }
}

