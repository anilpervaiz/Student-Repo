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
            tableView.tableFooterView = tableFooterView
            tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
            tableView.registerNibCell(with: PersonDetailsTableViewCell.self)
            tableView.registerNibCell(with: RateTeacherTableViewCell.self)
            tableView.registerNibCell(with: SessionFeesTableViewCell.self)
            tableView.registerNibCell(with: SubjectDetailTableViewCell.self)
            tableView.registerNibCell(with: DateAndTimeTableViewCell.self)
            tableView.registerNibCell(with: PaymentMethodTableViewCell.self)
        }
    }

    private lazy var tableFooterView: UIView = {
        let customView = UIView(frame: CGRect(x: 0,
                                              y: 0,
                                              width: UIScreen.main.bounds.width,
                                              height: 56 + 32))
        customView.backgroundColor = .clear
        let button = PrimaryCTAButton(type: .system).preparedForAutolayout()
        button.setTitle("Book Again", for: .normal)
        button.buttonThemeColor = Asset.Colors.aquaMarine.color
        button.buttonBackgroundColor = Asset.Colors.primary.color
        button.addTarget(self, action: #selector(didTapBookSessionAgain), for: .touchUpInside)
        customView.addSubview(button)
        button.fillSuperview(edgeInset: UIEdgeInsets(top: 32, left: 16, bottom: 0, right: 16))
        return customView
    }()

    @objc
    func didTapBookSessionAgain() {

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
        guard let viewModel = viewModel,
              let cellType = viewModel.cell(at: indexPath.row)
        else { return UITableViewCell() }
        
        switch cellType {
        case .studentParent:
            let cell = tableView.dequeueReusableCell(withType: PersonDetailsTableViewCell.self)
            cell.configure(with: viewModel.personDetailsViewModel)
            return cell
        case .rateStudent:
            let cell = tableView.dequeueReusableCell(withType: RateTeacherTableViewCell.self)
            return cell
        case .subject:
            let cell = tableView.dequeueReusableCell(withType: SubjectDetailTableViewCell.self)
            cell.configure(with: viewModel.subjectDetailTableViewModel)
            return cell
        case .dateAndTime:
            let cell = tableView.dequeueReusableCell(withType: DateAndTimeTableViewCell.self)
            cell.configure(with: viewModel.dateAndTimeTableViewModel)
            return cell
        case .paymentMethod:
            let cell = tableView.dequeueReusableCell(withType: PaymentMethodTableViewCell.self)
            cell.configure(with: viewModel.paymentMethodTableViewModel)
            return cell
        case .sessionFees:
            let cell = tableView.dequeueReusableCell(withType: SessionFeesTableViewCell.self)
            cell.separatorInset = UIEdgeInsets(top: 0, left: cell.bounds.size.width, bottom: 0, right: 0)
            cell.configure(with: viewModel.sessionFeesViewModel)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel?.didSelectCell(at: indexPath.row)
    }
}

