//
//  SessionBookingCompletedViewController.swift
//  Students
//
//  Created by Rahim on 18/04/2021.
//

import UIKit

class SessionBookingCompletedViewController: BaseViewController {

    var viewModel: SessionBookingCompletedViewModel?
    var onOperationCompleted: (() -> ())?
    @IBOutlet weak var tableView: UITableView! {
        didSet {

            tableView.delegate = self
            tableView.dataSource = self

            tableView.registerNibCell(with: TitleWithDescriptionTableViewCell.self)
            tableView.registerNibCell(with: PersonDetailsTableViewCell.self)
            tableView.registerNibCell(with: SubjectDetailTableViewCell.self)
            tableView.registerNibCell(with: DateAndTimeTableViewCell.self)
            tableView.registerNibCell(with: SessionFeesTableViewCell.self)
            tableView.registerNibCell(with: SelectedPaymentMethodSessionCompletionTableViewCell.self)
            tableView.registerNibCell(with: LinkedAccountSessionCompletedTableViewCell.self)

            tableView.allowsSelection = false
            tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 8))
            tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 8))
        }
    }

    @IBAction func didTapDoneButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        onOperationCompleted?()
    }
    @IBAction func didTapCancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        onOperationCompleted?()
    }
}

extension SessionBookingCompletedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.numberOfRows ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = viewModel?.cellViewModel(for: indexPath.row)

        if let cellViewModel = cellViewModel as? TitleWithDescriptionTableCellViewModel {
            let cell = tableView.dequeueReusableCell(withType: TitleWithDescriptionTableViewCell.self)
            cell.configure(with: cellViewModel)
            return cell
        } else if let cellViewModel = cellViewModel as? PersonDetailsTableViewCellViewModel {
            let cell = tableView.dequeueReusableCell(withType: PersonDetailsTableViewCell.self)
            cell.configure(with: cellViewModel)
            cell.personDetailContainerView.backgroundColor = .clear
            cell.personDetailContainerView.borderWidth = 0
            cell.chatButton.isHidden = true
            return cell
        } else if let cellViewModel = cellViewModel as? SubjectDetailTableViewCellViewModel {
            let cell = tableView.dequeueReusableCell(withType: SubjectDetailTableViewCell.self)
            cell.configure(with: cellViewModel)
            return cell
        } else if let cellViewModel = cellViewModel as? DateAndTimeTableViewCellViewModel {
            let cell = tableView.dequeueReusableCell(withType: DateAndTimeTableViewCell.self)
            cell.configure(with: cellViewModel)
            return cell
        } else if let cellViewModel = cellViewModel as? SelectedPaymentMethodSessionCompletionTableCellViewModel {
            let cell = tableView.dequeueReusableCell(withType: SelectedPaymentMethodSessionCompletionTableViewCell.self)
            cell.configure(viewModel: cellViewModel)
            return cell
        } else if let cellViewModel = cellViewModel as? SessionFeesTableViewCellViewModel {
            let cell = tableView.dequeueReusableCell(withType: SessionFeesTableViewCell.self)
            cell.configure(with: cellViewModel)
            cell.backgroundColor = Asset.Colors.borderColor.color
            return cell
        } else if let cellViewModel = cellViewModel as? LinkedAccountSessionCompletedTableCellViewModel {
            let cell = tableView.dequeueReusableCell(withType: LinkedAccountSessionCompletedTableViewCell.self)
            cell.configure(viewModel: cellViewModel)
            return cell
        }
        return UITableViewCell()
    }
}

extension SessionBookingCompletedViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .sessionBookingCompleted }
}
