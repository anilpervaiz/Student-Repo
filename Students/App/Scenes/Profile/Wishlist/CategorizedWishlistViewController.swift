//
//  CategorizedWishlistViewController.swift
//  Students
//
//  Created by Rahim on 10/04/2021.
//

import UIKit

class CategorizedWishlistViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.tableFooterView = UIView()

            tableView.registerNibHeaderFooterView(with: TableSectionHeaderView.self)
            tableView.registerNibCell(with: CollapsedTableViewCell.self)
            tableView.registerNibCell(with: WishlistTableViewCell.self)
        }
    }
    var viewModel: CategorizedWishlistViewModel = .init()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Wishlist"

        bindViewModel()
    }

    func bindViewModel() {
        viewModel.output = { [weak self] output in
            switch output {
            case .reloadData: self?.tableView.reloadData()
            }
        }
    }
}

extension CategorizedWishlistViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSection
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows(in: section)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerDetails = viewModel.header(in: section)
        let view = tableView.dequeueReusableHeaderFooterView(withType: TableSectionHeaderView.self)
        view?.titleLabel.text = headerDetails
        view?.descriptionLabel.text = ""
        return view
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if viewModel.isCollapsedRow(at: indexPath) {
            let cell = tableView.dequeueReusableCell(withType: CollapsedTableViewCell.self)
            cell.titleLabel.text = "\(viewModel.totalNumberOfRows(in: indexPath.section) - viewModel.numberOfRows(in: indexPath.section) + 1) More Teachers"

            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withType: WishlistTableViewCell.self)
            cell.configure(with: viewModel.wishlist(for: indexPath))
            return cell
        }
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == tableView.numberOfSections - 1 {
            return nil
        }

        let footerView = UIView()
        let divider = UIView().preparedForAutolayout()
        divider.backgroundColor = Asset.Colors.disableGray.color

        footerView.addSubview(divider)

        divider.fillSuperview(edgeInset: UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0))
        NSLayoutConstraint.activate([
            divider.heightAnchor.constraint(equalToConstant: 2)
        ])
        return footerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        44
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.didSelectRow(at: indexPath)
    }
}

extension CategorizedWishlistViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .wishlist }
}
