//
//  FilterTeacherOptionSelectionTableViewCell.swift
//  Students
//
//  Created by Rahim on 11/04/2021.
//

import UIKit

class FilterTeacherOptionSelectionTableViewCell: UITableViewCell,
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
    
    var viewModel: FilterTeacherOptionSelectionViewModel?

    func configure(viewModel: FilterTeacherOptionSelectionViewModel) {
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
