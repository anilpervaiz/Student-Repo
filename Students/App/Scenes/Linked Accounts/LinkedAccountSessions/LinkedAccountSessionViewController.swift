//
//  LinkedAccountSessionViewController.swift
//  Students
//
//  Created by Rahim on 28/04/2021.
//

import UIKit

class LinkedAccountSessionViewController: UIViewController {

    var viewModel: LinkedAccountSessionViewModel = .init()

    @IBOutlet weak var sessionTableView: UITableView! {
        didSet {
            sessionTableView.delegate = self
            sessionTableView.dataSource = self

            sessionTableView.registerNibCell(with: SessionTableViewCell.self)
        }
    }
    @IBOutlet weak var filterCollectionView: UICollectionView! {
        didSet {
            filterCollectionView.delegate = self
            filterCollectionView.dataSource = self
            filterCollectionView.registerNibCell(with: FilterDropdownCollectionViewCell.self)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }

    func bindViewModel() {
        viewModel.output = { [weak self] output in
            switch output {
            case .reloadFilters: self?.filterCollectionView.reloadData()
            case .showSubjectBottomDrawer: self?.presentSubjectSheet()
            }
        }
    }

    func presentSubjectSheet() {
        let viewController = BottomSheet.getInstance()
        viewController.modalPresentationStyle = .overCurrentContext
        viewController.modalTransitionStyle = .crossDissolve

        viewController.viewModel = BottomSheetViewModel(with: "Select Subject", items: [
            BottomSheetListCellViewModel(isSelected: true, title: "All Subjects"),
            BottomSheetListCellViewModel(isSelected: false, title: "Math"),
            BottomSheetListCellViewModel(isSelected: false, title: "English"),
        ])
        viewController.onDismissWithSelection = { [weak self] selected in
            guard let selectedSubject = selected else { return }
            self?.viewModel.didSelectSubject(title: selectedSubject)
        }
        present(viewController, animated: true, completion: nil)
    }

    @IBAction func didTapAddNewSession(_ sender: Any) {

        let viewController = LinkedAccountNewSessionViewController.getInstance()
        let navigationController = BaseNavigationController(rootViewController: viewController)

        navigationController.modalPresentationStyle = .fullScreen

        present(navigationController, animated: true, completion: nil)
    }
}

extension LinkedAccountSessionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.filters.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withType: FilterDropdownCollectionViewCell.self,
                                                      for: indexPath)
        cell.configure(filter: viewModel.filters[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.filters[indexPath.row].isSelected = !viewModel.filters[indexPath.row].isSelected
        viewModel.didSelectFilter(at: indexPath.row)
    }
}

extension LinkedAccountSessionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.session.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withType: SessionTableViewCell.self,
                                                 for: indexPath)
        cell.configure(session: viewModel.session[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        navigateToSessionDetails()
    }

    func navigateToSessionDetails() {
        guard let navigationController = navigationController as? BaseNavigationController else { return }
        let viewController = SessionDetailBuilder().makeViewController(navigationController: navigationController,
                                                                       sessionState: .accepted)
        viewController.hidesBottomBarWhenPushed = true
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension LinkedAccountSessionViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .linkedAccountSession }
}
