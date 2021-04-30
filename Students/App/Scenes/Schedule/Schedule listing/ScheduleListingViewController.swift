//
//  ScheduleListingViewController.swift
//  Teachers
//
//  Created by Rahim on 24/03/2021.
//
import UIKit
import FSCalendar

class ScheduleListingViewController: BaseViewController {
    var viewModel: ScheduleListingViewModel?

    @IBOutlet weak var scheduleTableView: UITableView! {
        didSet {
            scheduleTableView.delegate = self
            scheduleTableView.dataSource = self
            scheduleTableView.registerNibCell(with: SessionTableViewCell.self)
            scheduleTableView.tableFooterView = UIView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }

    func bindViewModel() {
        viewModel?.output = { [weak self] output in
            switch output {
            case .reloadData:
                self?.scheduleTableView.reloadData()
            }
        }
    }
}

extension ScheduleListingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.numberOfItems ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withType: SessionTableViewCell.self)
        if let session = viewModel?.getSession(at: indexPath.row) {
            cell.configure(session: session, hideSessionStateView: !(viewModel?.shouldShowSessionState ?? true))
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel?.didTapRequest(at: indexPath.row)
    }
}

extension ScheduleListingViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .schedule }
}
