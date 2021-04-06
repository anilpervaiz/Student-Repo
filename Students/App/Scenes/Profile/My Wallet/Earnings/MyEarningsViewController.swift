//
//  MyEarningsViewController.swift
//  Teachers
//
//  Created by Rahim on 02/04/2021.
//

import UIKit

class MyEarningsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.registerNibCell(with: EarningRowTableViewCell.self)
            tableView.registerNibHeaderFooterView(with: TableSectionHeaderView.self)
        }
    }
    var viewModel: MyEarningsViewModel = .init()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableHeaderView()
    }

    func setupTableHeaderView() {
        let header = EarningSummaryTableHeaderView()
        header.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 166)
        tableView.tableHeaderView = header
    }
}

extension MyEarningsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSection
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows(in: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withType: EarningRowTableViewCell.self)
        let row = viewModel.row(at: indexPath)
        cell.titleLabel.text = row.title
        cell.descriptionLabel.text = row.description
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withType: TableSectionHeaderView.self)

        view?.titleLabel.text = viewModel.section[section].title
        view?.titleLabel.textColor = Asset.Colors.gray.color
        view?.descriptionLabel.text = ""
        return view
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        56
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

extension MyEarningsViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .profile }
}
