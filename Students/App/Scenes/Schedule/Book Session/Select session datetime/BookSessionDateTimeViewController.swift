//
//  BookSessionViewController.swift
//  Students
//
//  Created by Rahim on 17/04/2021.
//

import UIKit

class BookSessionDateTimeViewController: BaseViewController {

    var viewModel: BookSessionDateTimeViewModel?

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self

            tableView.registerNibCell(with: AvailabilityHourCollectionTableViewCell.self)
            tableView.registerNibCell(with: CalendarTableViewCell.self)
            tableView.registerNibCell(with: SessionFeesTableViewCell.self)

            tableView.tableFooterView = UIView()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Session Date & Time"
    }

    @IBAction func didTapContinueBooking(_ sender: Any) {
        viewModel?.didTapContinueBooking()
    }
}

extension BookSessionDateTimeViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.numberOfRows ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellViewModel = viewModel?.cellViewModel(at: indexPath.row) else {
            return UITableViewCell()
        }

        if let cellViewModel = cellViewModel as? AvailibilityHourCollectionTableCellViewModel {
            let cell = tableView.dequeueReusableCell(withType: AvailabilityHourCollectionTableViewCell.self)
            cell.configure(viewModel: cellViewModel)
            return cell
        } else if let cellViewModel = cellViewModel as? CalendarTableCellViewModel {
            let cell = tableView.dequeueReusableCell(withType: CalendarTableViewCell.self)
            cell.configure(with: cellViewModel)
            return cell
        } else if let cellViewModel = cellViewModel as? SessionFeesTableViewCellViewModel {
            let cell = tableView.dequeueReusableCell(withType: SessionFeesTableViewCell.self)
            cell.configure(with: cellViewModel)
            cell.sessionFeesTitleLabel.font = .init(commonFont: PoppinsFontStyle.semiBold, size: 16)
            cell.sessionFeesTitleLabel.textColor = Asset.Colors.darkBlue.color
            return cell
        }

        return UITableViewCell()
    }
}

extension BookSessionDateTimeViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .bookSession }
}
