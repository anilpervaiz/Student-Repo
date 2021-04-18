//
//  FilteredTeachersViewController.swift
//  Students
//
//  Created by Rahim on 11/04/2021.
//

import UIKit

class FilteredTeachersViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self

            tableView.tableFooterView = UIView()
            tableView.registerNibCell(with: WishlistTableViewCell.self)
        }
    }
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self

            collectionView.registerNibCell(with: FilterTagCollectionViewCell.self)
            collectionView.contentInset = UIEdgeInsets(top: 0,
                                                       left: 16,
                                                       bottom: 0,
                                                       right: 16)
        }
    }
    var viewModel: FilteredTeachersViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        bindViewModel()
        title = "Select Teacher"
    }

    func bindViewModel() {
        viewModel?.output = { [weak self] output in
            switch output {
            case .reloadFilters: self?.collectionView.reloadData()
            case .reloadTeacherList: self?.tableView.reloadData()
            }
        }
    }
}

extension FilteredTeachersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.numberOfTeachers ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withType: WishlistTableViewCell.self)
        if let teacher = viewModel?.teacher(at: indexPath.row) {
            cell.configure(with: teacher)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.didSelectTeacher(at: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension FilteredTeachersViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.numberOfFilters ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withType: FilterTagCollectionViewCell.self, for: indexPath)
        if let filter = viewModel?.filter(at: indexPath.row) {
            cell.configure(with: filter) { [weak self] in
                self?.viewModel?.didRemoveFilter(at: indexPath.row)
            }
        }
        return cell
    }
}

extension FilteredTeachersViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .browse }
}
