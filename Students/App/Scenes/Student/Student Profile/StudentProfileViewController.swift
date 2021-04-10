//
//  StudentProfileViewController.swift
//  Teachers
//
//  Created by Rahim on 26/03/2021.
//

import UIKit

class StudentProfileViewController: BaseViewController {

    var viewModel: StudentProfileViewModel? {
        didSet {
            viewModel?.setupData()
        }
    }
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.registerNibCell(with: RateTeacherTableViewCell.self)
            tableView.registerNibCell(with: StudentProfileParentTableViewCell.self)
            tableView.registerNibCell(with: CollapsedTableViewCell.self)
            tableView.registerNibCell(with: SessionTableViewCell.self)
            tableView.registerNibCell(with: ReviewTableViewCell.self)

            
            tableView.registerNibHeaderFooterView(with: TableSectionHeaderView.self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.tintColor = Asset.Colors.pureWhite.color
        bindViewModel()
        if let student = viewModel?.student {
            let header = StudentProfileTableHeaderView()
            header.configure(with: student) { [weak self] in
                self?.viewModel?.didTapChatWithStudentButton()
            }
            header.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 232)
            tableView.tableHeaderView = header
        }
    }

    private func bindViewModel() {
        viewModel?.output = { [weak self] output in
            switch output {
            case .reloadData:
                self?.tableView.reloadData()
            }
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
        navigationController?.navigationBar.barStyle = .blackTranslucent
    }
}

extension StudentProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        StudentProfileViewModel.Section.allCases.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.numberOfRows(for: section) ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cellType = viewModel?.cellType(for: indexPath) {
            switch cellType {
            case .writeAReview:
                let cell = tableView.dequeueReusableCell(withType: RateTeacherTableViewCell.self)
                return cell
            case .parent(let parent):
                let cell = tableView.dequeueReusableCell(withType: StudentProfileParentTableViewCell.self)
                cell.configure(with: parent)
                cell.didTapChatButton = { [weak self] in
                    self?.viewModel?.didTapCellForRow(at: indexPath)
                }
                return cell
            case .session(let session):
                let cell = tableView.dequeueReusableCell(withType: SessionTableViewCell.self)
                cell.configure(session: session, hiddenUserDetails: true)
                return cell

            case .review(let review):
                let cell = tableView.dequeueReusableCell(withType: ReviewTableViewCell.self)
                cell.configure(with: review)
                return cell

            case .collapsed(let details):
                let cell = tableView.dequeueReusableCell(withType: CollapsedTableViewCell.self)
                cell.titleLabel.text = details
                return cell
            }
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let headerDetails = viewModel?.headerDetails(for: section) {
            let view = tableView.dequeueReusableHeaderFooterView(withType: TableSectionHeaderView.self)
            view?.titleLabel.text = headerDetails.0
            view?.descriptionLabel.text = headerDetails.1
            return view
        }
        return nil
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel?.didTapCellForRow(at: indexPath)
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if viewModel?.headerDetails(for: section) != nil {
            return 44
        }
        return 0
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == StudentProfileViewModel.Section.allCases.count - 1 {
            return 0
        }
        return 18
    }
}

extension StudentProfileViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .student }
}
