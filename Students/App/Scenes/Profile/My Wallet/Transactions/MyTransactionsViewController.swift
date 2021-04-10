//
//  MyTransactionsViewController.swift
//  Teachers
//
//  Created by Rahim on 02/04/2021.
//

import UIKit

class MyTransactionsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.registerNibCell(with: TransactionTableViewCell.self)
            tableView.registerNibCell(with: CollapsedTableViewCell.self)
            tableView.registerNibHeaderFooterView(with: TableSectionHeaderView.self)
        }
    }
    var viewModel: MyTransactionViewModel = .init()

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        title = "My Wallet"
    }

    func bindViewModel() {
        viewModel.output = { [weak self] output in
            switch output {
            case .reloadData:
            self?.tableView.reloadData()
            }
        }
    }
}

extension MyTransactionsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows(in: section)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withType: TableSectionHeaderView.self)
        headerView?.titleLabel.text = viewModel.titleForHeader(in: section)
        headerView?.titleLabel.textColor = Asset.Colors.gray.color
        let numberOfRows = viewModel.totalNumberOfRows(in: section)
        headerView?.descriptionLabel.text = numberOfRows > 1 ? " (\(numberOfRows))" : ""
        headerView?.descriptionLabel.font = .init(commonFont: PoppinsFontStyle.regular, size: 10)

        return headerView
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if viewModel.isCollapsed(indexPath: indexPath) {
            let cell = tableView.dequeueReusableCell(withType: CollapsedTableViewCell.self)
            cell.titleLabel.text = "\(viewModel.totalNumberOfRows(in: indexPath.section) - viewModel.numberOfRows(in: indexPath.section) + 1) More Transactions"

            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withType: TransactionTableViewCell.self)
            if let transaction = viewModel.transaction(at: indexPath) {
                cell.configure(transaction: transaction)
            }
            cell.divider.isHidden = viewModel.numberOfRows(in: indexPath.section) - 1 == indexPath.row
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRow(at: indexPath)
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == StudentProfileViewModel.Section.allCases.count - 1 {
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
}

extension MyTransactionsViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .profile }
}
