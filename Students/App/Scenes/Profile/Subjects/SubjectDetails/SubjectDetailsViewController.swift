//
//  SubjectDetailsViewController.swift
//  Teachers

import Foundation
import UIKit

class SubjectDetailsViewController: BaseViewController {
    var viewModel: SubjectDetailsViewModel?
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.tableFooterView = UIView()
            tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
            tableView.registerNibCell(with: StudentParentDetailsTableViewCell.self)
            tableView.registerNibCell(with: RateStudentTableViewCell.self)
            tableView.registerNibCell(with: SessionFeesTableViewCell.self)
            tableView.registerNibCell(with: SubjectDetailTableViewCell.self)
            tableView.registerNibCell(with: DateAndTimeTableViewCell.self)
            tableView.registerNibCell(with: PaymentMethodTableViewCell.self)
        }
    }
}

extension SubjectDetailsViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .profile }
}

extension SubjectDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.numberOfCells ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        guard let viewModel = viewModel,
              let cellType = viewModel.cell(at: indexPath.row)
        else { return cell }
        
        switch cellType {
        case .studentParent:
            cell = tableView.dequeueReusableCell(withType: StudentParentDetailsTableViewCell.self)
            (cell as? StudentParentDetailsTableViewCell)?.configure(with: viewModel.studentParentDetailsViewModel)
        case .rateStudent:
            cell = tableView.dequeueReusableCell(withType: RateStudentTableViewCell.self)
        case .subject:
            cell = tableView.dequeueReusableCell(withType: SubjectDetailTableViewCell.self)
            (cell as? SubjectDetailTableViewCell)?.configure(with: viewModel.subjectDetailTableViewModel)
        case .dateAndTime:
            cell = tableView.dequeueReusableCell(withType: DateAndTimeTableViewCell.self)
            (cell as? DateAndTimeTableViewCell)?.configure(with: viewModel.dateAndTimeTableViewModel)
        case .paymentMethod:
            cell = tableView.dequeueReusableCell(withType: PaymentMethodTableViewCell.self)
            (cell as? PaymentMethodTableViewCell)?.configure(with: viewModel.paymentMethodTableViewModel)
        case .sessionFees:
            cell = tableView.dequeueReusableCell(withType: SessionFeesTableViewCell.self)
            cell.separatorInset = UIEdgeInsets(top: 0, left: cell.bounds.size.width, bottom: 0, right: 0)
            (cell as? SessionFeesTableViewCell)?.configure(with: viewModel.sessionFeesViewModel)
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.didSelectCell(at: indexPath.row)
    }
}

