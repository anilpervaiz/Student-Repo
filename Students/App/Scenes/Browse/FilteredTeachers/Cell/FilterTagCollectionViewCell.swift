//
//  FilterTagCollectionViewCell.swift
//  Students
//
//  Created by Rahim on 11/04/2021.
//

import UIKit

class FilterTagCollectionViewCell: UICollectionViewCell,
                                   ReusableView {
    var didRemoveFilter: (() -> ())?

    @IBOutlet weak var filterTextLabel: UILabel!

    func configure(with text: String, didRemoveFilter: (() -> ())?) {
        filterTextLabel.text = text
        self.didRemoveFilter = didRemoveFilter
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        didRemoveFilter = nil
        filterTextLabel.text = ""
    }

    @IBAction func didTapRemoveFilterButton(_ sender: Any) {
        didRemoveFilter?()
    }
}
