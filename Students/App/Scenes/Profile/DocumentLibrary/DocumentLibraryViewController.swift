//
//  DocumentLibraryViewController.swift
//  Teachers
//
//  Created by Rahim on 03/04/2021.
//

import UIKit

class DocumentLibraryViewController: BaseViewController {

    var viewModel: DocumentLibraryViewModel = .init()

    lazy var addBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: Asset.Media.circularAddIcon.image, style: .plain, target: self, action: #selector(didTapAddDocumentButton(_:)))
        button.tintColor = Asset.Colors.halfBaked.color
        return button
    }()
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.registerNibCell(with: DocumentCell.self)
            tableView.registerNibCell(with: CollapsedTableViewCell.self)
            tableView.registerNibHeaderFooterView(with: TableSectionHeaderView.self)
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        navigationItem.rightBarButtonItem = addBarButton
        title = "Document Library"
    }

    func bindViewModel() {
        viewModel.output = { [weak self] output in
            switch output {
            case .reloadData: self?.tableView.reloadData()
            }
        }
    }

    @IBAction func didTapAddDocumentButton(_ sender: Any) {
        let viewController = AddDocumentViewController.getInstance()
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension DocumentLibraryViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.rows(in: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if viewModel.isCollapsed(section: indexPath.section, row: indexPath.row) {
            let cell = tableView.dequeueReusableCell(withType: CollapsedTableViewCell.self)
            cell.titleLabel.text = "\(viewModel.totalRows(in: indexPath.section) - viewModel.rows(in: indexPath.section) + 1) More Documents"
            return cell
        }
        let cell = tableView.dequeueReusableCell(withType: DocumentCell.self)
        cell.configure(with: viewModel.document(in: indexPath))

        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withType: TableSectionHeaderView.self)
        headerView?.titleLabel.text = viewModel.titleForHeader(in: section)
        headerView?.titleLabel.textColor = Asset.Colors.gray.color
        let numberOfRows = viewModel.totalRows(in: section)
        headerView?.descriptionLabel.text = numberOfRows > 1 ? " (\(numberOfRows))" : ""
        headerView?.descriptionLabel.font = .init(commonFont: PoppinsFontStyle.regular, size: 10)

        return headerView
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if viewModel.isCollapsed(section: indexPath.section, row: indexPath.row) {
            viewModel.expand(section: indexPath.section)
        }
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

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        44
    }
}

extension DocumentLibraryViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .profile }
}
