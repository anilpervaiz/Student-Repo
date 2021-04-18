//
//  BookSessionViewController.swift
//  Students
//
//  Created by Rahim on 18/04/2021.
//

import UIKit

class BookSessionViewController: BaseViewController {

    var viewModel: BookSessionViewModel?

    private lazy var tableFooterView: UIView = {
        let customView = UIView(frame: CGRect(x: 0,
                                              y: 0,
                                              width: UIScreen.main.bounds.width,
                                              height: 56 + 32))
        customView.backgroundColor = .clear
        let button = PrimaryCTAButton(type: .system).preparedForAutolayout()
        button.setTitle("Confirm", for: .normal)
        button.buttonThemeColor = Asset.Colors.aquaMarine.color
        button.buttonBackgroundColor = Asset.Colors.primary.color
        button.addTarget(self, action: #selector(didTapConfirmBooking), for: .touchUpInside)
        customView.addSubview(button)
        button.fillSuperview(edgeInset: UIEdgeInsets(top: 24, left: 16, bottom: 0, right: 16))
        return customView
    }()

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self

            tableView.registerNibCell(with: PersonDetailsTableViewCell.self)
            tableView.registerNibCell(with: SubjectDetailTableViewCell.self)
            tableView.registerNibCell(with: DateAndTimeTableViewCell.self)
            tableView.registerNibCell(with: OptionSelectionTableViewCell.self)
            tableView.registerNibCell(with: SessionFeesTableViewCell.self)

            tableView.registerNibCell(with: AddPaymentMethodTableViewCell.self)
            tableView.registerNibCell(with: PaymentMethodSelectionTableViewCell.self)

            tableView.tableFooterView = tableFooterView
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Payment"
        bindViewModel()
    }

    func bindViewModel() {
        viewModel?.output = { [weak self] output in
            switch output {
            case .reloadSection(let sectionIndex):
                self?.tableView.reloadSections(IndexSet(integersIn: sectionIndex...sectionIndex), with: .automatic)
            }
        }
    }

    @objc
    func didTapConfirmBooking() {

    }
}

extension BookSessionViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel?.numberOfSections ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.numberOfRows(in: section) ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = viewModel?.cellViewModel(at: indexPath)

        if let cellViewModel = cellViewModel as? PersonDetailsTableViewCellViewModel {
            let cell = tableView.dequeueReusableCell(withType: PersonDetailsTableViewCell.self)
            cell.configure(with: cellViewModel)
            return cell
        } else if let cellViewModel = cellViewModel as? SubjectDetailTableViewCellViewModel {
            let cell = tableView.dequeueReusableCell(withType: SubjectDetailTableViewCell.self)
            cell.configure(with: cellViewModel)
            return cell
        } else if let cellViewModel = cellViewModel as? DateAndTimeTableViewCellViewModel {
            let cell = tableView.dequeueReusableCell(withType: DateAndTimeTableViewCell.self)
            cell.configure(with: cellViewModel)
            return cell
        } else if let cellViewModel = cellViewModel as? OptionSelectionRowViewModel {
            let cell = tableView.dequeueReusableCell(withType: OptionSelectionTableViewCell.self)
            cell.configure(viewModel: cellViewModel)
            return cell
        } else if let cellViewModel = cellViewModel as? SessionFeesTableViewCellViewModel {
            let cell = tableView.dequeueReusableCell(withType: SessionFeesTableViewCell.self)
            cell.configure(with: cellViewModel)
            cell.sessionFeesTitleLabel.font = .init(commonFont: PoppinsFontStyle.semiBold, size: 16)
            cell.sessionFeesTitleLabel.textColor = Asset.Colors.darkBlue.color
            cell.descriptionView.isHidden = false
            return cell
        } else if let cellViewModel = cellViewModel as? AddPaymentMethodTableCellViewModel {
            let cell = tableView.dequeueReusableCell(withType: AddPaymentMethodTableViewCell.self)
            return cell
        } else if let cellViewModel = cellViewModel as? PaymentMethodSelectionTableCellViewModel {
            let cell = tableView.dequeueReusableCell(withType: PaymentMethodSelectionTableViewCell.self)
            cell.configure(viewModel: cellViewModel)
            return cell
        }

        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        viewModel?.didSelectRow(at: indexPath)
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {

        if section == (viewModel?.numberOfSections ?? 0) - 1 {
            return nil
        }

        let footerView = UIView()
        let divider = UIView().preparedForAutolayout()
        divider.backgroundColor = Asset.Colors.disableGray.color

        footerView.addSubview(divider)

        var topSpacing: CGFloat = 4
        if viewModel?.isOptionSelectionSection(at: section) ?? false {
            topSpacing = 12
        }

        divider.fillSuperview(edgeInset: UIEdgeInsets(top: topSpacing, left: 16, bottom: 8, right: 0))
        NSLayoutConstraint.activate([
            divider.heightAnchor.constraint(equalToConstant: 1)
        ])
        return footerView
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == (viewModel?.numberOfSections ?? 0) - 1 {
            return 0
        }
        if viewModel?.isOptionSelectionSection(at: section) ?? false {
            return 21
        }
        return 13
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = viewModel?.sectionHeader(for: section),
              section < (viewModel?.numberOfSections ?? 0) - 1 else {
            return nil
        }

        let headerView = UIView()
        let titleLable = UILabel().preparedForAutolayout()
        titleLable.text = header
        titleLable.font = .init(commonFont: PoppinsFontStyle.semiBold, size: 12)
        titleLable.textColor = Asset.Colors.gray.color

        headerView.addSubview(titleLable)

        titleLable.fillSuperview(edgeInset: UIEdgeInsets(top: 8, left: 16, bottom: 2, right: 16))
        
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let header = viewModel?.sectionHeader(for: section) else { return 0 }
        return 38
    }
}

extension BookSessionViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .bookSession }
}
