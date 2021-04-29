//
//  TeacherProfileViewController.swift
//  Students
//
//  Created by Rahim on 16/04/2021.
//

import UIKit

class TeacherProfileViewController: BaseViewController {

    var viewModel: TeacherProfileViewModel?

    private lazy var tableFooterView: UIView = {
        let customView = UIView(frame: CGRect(x: 0,
                                              y: 0,
                                              width: UIScreen.main.bounds.width,
                                              height: 56 + 32))
        customView.backgroundColor = .clear
        let button = PrimaryCTAButton(type: .system).preparedForAutolayout()
        button.setTitle(viewModel?.bookSessionButtonTitle, for: .normal)
        button.buttonThemeColor = Asset.Colors.aquaMarine.color
        button.buttonBackgroundColor = Asset.Colors.primary.color
        button.addTarget(self, action: #selector(didTapBookSesstion), for: .touchUpInside)
        customView.addSubview(button)
        button.fillSuperview(edgeInset: UIEdgeInsets(top: 32, left: 16, bottom: 0, right: 16))
        return customView
    }()

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self

            tableView.tableFooterView = tableFooterView

            tableView.registerNibCell(with: TagCollectionTableViewCell.self)
            tableView.registerNibCell(with: TitleWithDescriptionTableViewCell.self)
            tableView.registerNibCell(with: ReviewTableViewCell.self)
            tableView.registerNibHeaderFooterView(with: TableSectionHeaderView.self)
            tableView.registerNibCell(with: CollapsedTableViewCell.self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bindViewModel()
    }

    func setupView() {

        if let teacher = viewModel?.teacher {
            let header = TeacherProfileHeaderView()
            header.configure(with: teacher) { [weak self] in
                self?.viewModel?.didTapChatWithTeacher()
            }
            header.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 254)
            tableView.tableHeaderView = header
        }
    }

    func bindViewModel() {
        viewModel?.output = { [weak self] output  in
            switch output {
            case .reloadSection(let index):
                self?.tableView.reloadSections(IndexSet(integersIn: index...index), with: .automatic)
            }
        }
    }
}

@objc extension TeacherProfileViewController {
    func didTapBookSesstion() {
        viewModel?.didTapBookSession()
    }
}

extension TeacherProfileViewController: UITableViewDelegate,
                                        UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel?.numberOfSections ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.numberOfCell(in: section) ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel else {
            return UITableViewCell()
        }

        let cellViewModel = viewModel.cellViewModel(for: indexPath)

        if viewModel.isExpandableCell(for: indexPath) {
            let cell = tableView.dequeueReusableCell(withType: CollapsedTableViewCell.self)
            cell.titleLabel.text = "More Reviews"
            return cell
        }
        if let cellViewModel = cellViewModel as? TagCollectionTableCellViewModel {
            let cell = tableView.dequeueReusableCell(withType: TagCollectionTableViewCell.self)
            cell.configure(viewModel: cellViewModel)
            return cell
        } else if let cellViewModel = cellViewModel as? TitleWithDescriptionTableCellViewModel {
            let cell = tableView.dequeueReusableCell(withType: TitleWithDescriptionTableViewCell.self)
            cell.configure(with: cellViewModel)
            return cell
        } else if let cellViewModel = cellViewModel as? ReviewTableCellViewModel {
            let cell = tableView.dequeueReusableCell(withType: ReviewTableViewCell.self)
            cell.configure(with: cellViewModel)
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel?.didSelectRow(at: indexPath)
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        44
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerDetails = viewModel?.headerDetails(for: section) else { return nil }
        let view = tableView.dequeueReusableHeaderFooterView(withType: TableSectionHeaderView.self)
        view?.titleLabel.text = headerDetails.0
        view?.descriptionLabel.text = headerDetails.1
        return view
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {

        if section == (viewModel?.numberOfSections ?? 0) - 1 {
            return nil
        }

        let footerView = UIView()
        let divider = UIView().preparedForAutolayout()
        divider.backgroundColor = Asset.Colors.disableGray.color

        footerView.addSubview(divider)

        divider.fillSuperview(edgeInset: UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 0))
        NSLayoutConstraint.activate([
            divider.heightAnchor.constraint(equalToConstant: 1)
        ])
        return footerView
    }



    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == (viewModel?.numberOfSections ?? 0) - 1 {
            return 0
        }
        return 18
    }
}

extension TeacherProfileViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .teacherProfile }
}
