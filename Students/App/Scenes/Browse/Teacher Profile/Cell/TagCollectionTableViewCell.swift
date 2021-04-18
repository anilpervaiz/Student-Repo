//
//  TagCollectionTableViewCell.swift
//  Students
//
//  Created by Rahim on 17/04/2021.
//

import UIKit

class TagCollectionTableViewCell: UITableViewCell,
                                  ReusableView {
    var viewModel: TagCollectionTableCellViewModel?
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self

            collectionView.registerNibCell(with: TagCollectionViewCell.self)
        }
    }

    func configure(viewModel: TagCollectionTableCellViewModel) {
        self.viewModel = viewModel

        collectionView.reloadData()
    }
}

extension TagCollectionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.tags.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withType: TagCollectionViewCell.self,
                                                      for: indexPath)
        cell.titleLabel.text = viewModel?.tags[indexPath.row] ?? ""

        return cell
    }
}

struct TagCollectionTableCellViewModel: TableCellViewModel {
    var tags: [String]
}
