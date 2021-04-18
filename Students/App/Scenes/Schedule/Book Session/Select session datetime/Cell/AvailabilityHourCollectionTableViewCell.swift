//
//  AvailabilityHourCollectionTableViewCell.swift
//  Students
//
//  Created by Rahim on 17/04/2021.
//

import UIKit

class AvailabilityHourCollectionTableViewCell: UITableViewCell,
                                               ReusableView {

    var viewModel: AvailibilityHourCollectionTableCellViewModel?
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self

            collectionView.registerNibCell(with: AvailibilityHourCell.self)
        }
    }

    func configure(viewModel: AvailibilityHourCollectionTableCellViewModel) {
        self.viewModel = viewModel

        collectionView.reloadData()
    }
}

extension AvailabilityHourCollectionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.hours.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withType: AvailibilityHourCell.self,
                                                      for: indexPath)
        if let hours = viewModel?.hours[indexPath.row] {
            cell.configure(with: hours)
        }

        return cell
    }
}

struct AvailibilityHourCollectionTableCellViewModel: TableCellViewModel {
    var hours: [AvailibilityCellViewModel]
}
