//
//  FilterTeachersViewController.swift
//  Students
//
//  Created by Rahim on 11/04/2021.
//

import UIKit

class FilterTeachersViewController: BaseViewController {

    var onFilterSelected: (() -> ())?

    lazy var closeNavigationBarButton: UIBarButtonItem = {
        let view = NavigationBarItem()
        view.itemImage = Asset.Media.close.image

        let barButton = UIBarButtonItem(customView: view)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapCloseButton))
        view.addGestureRecognizer(gesture)
        return barButton
    }()

    lazy var clearNavigationBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(didTapClearButton))
        button.tintColor = Asset.Colors.tomatoRed.color
        return button
    }()

    private lazy var tableFooterView: UIView = {
        let customView = UIView(frame: CGRect(x: 0,
                                              y: 0,
                                              width: UIScreen.main.bounds.width,
                                              height: 56 + 32))
        customView.backgroundColor = .clear
        let button = PrimaryCTAButton(type: .system).preparedForAutolayout()
        button.setTitle("Apply Filters", for: .normal)
        button.buttonThemeColor = Asset.Colors.aquaMarine.color
        button.buttonBackgroundColor = Asset.Colors.primary.color
        button.addTarget(self, action: #selector(didTapApplyFilter), for: .touchUpInside)
        customView.addSubview(button)
        button.fillSuperview(edgeInset: UIEdgeInsets(top: 32, left: 16, bottom: 0, right: 16))
        return customView
    }()

    @IBOutlet weak var tableViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self

            tableView.tableFooterView = tableFooterView
            tableView.registerNibCell(with: FilterTeacherSwitchTableViewCell.self)
            tableView.registerNibCell(with: FilterTeacherRadioButtonTableViewCell.self)
            tableView.registerNibCell(with: FilterTeacherDropdownTableViewCell.self)
            tableView.registerNibCell(with: OptionSelectionTableViewCell.self)
            tableView.registerNibCell(with: FilterTeacherRangeTableViewCell.self)
            tableView.registerNibHeaderFooterView(with: TableSectionHeaderView.self)
        }
    }
    var viewModel: FilterTeacherViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupKeyboardNotification()

        navigationItem.leftBarButtonItem = closeNavigationBarButton
        navigationItem.rightBarButtonItem = clearNavigationBarButton
        title = "Filter"
    }

}

@objc
extension FilterTeachersViewController {
    func didTapCloseButton() {
        dismiss(animated: true, completion: nil)
    }

    func didTapClearButton() {

    }

    func didTapApplyFilter() {
        onFilterSelected?()
        dismiss(animated: true, completion: nil)
    }
}

extension FilterTeachersViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel?.numberOfSection ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.numberOfRows(in: section) ?? 0
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withType: TableSectionHeaderView.self)
        header?.titleLabel.text = viewModel?.title(at: section)
        header?.descriptionLabel.text = ""

        return header
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = viewModel?.row(at: indexPath).row
        switch row {
        case .titleWithSwitch:
            let cell = tableView.dequeueReusableCell(withType: FilterTeacherSwitchTableViewCell.self)
            if let cellViewModel = viewModel?.row(at: indexPath) as? FilterTeacherSwitchTableCellViewModel {
                cell.configure(viewModel: cellViewModel)
            }
            return cell
        case .radioButton:
            let cell = tableView.dequeueReusableCell(withType: FilterTeacherRadioButtonTableViewCell.self)
            if let cellViewModel = viewModel?.row(at: indexPath) as? FilterTeacherRadioButtonCellViewModel {
                cell.configure(viewModel: cellViewModel)
            }
            return cell
        case .dropdown:
            let cell = tableView.dequeueReusableCell(withType: FilterTeacherDropdownTableViewCell.self)
            if let cellViewModel = viewModel?.row(at: indexPath) as? FilterTeacherDropdownTableCellViewModel {
                cell.configure(viewModel: cellViewModel)
            }
            return cell
        case .optionSelection:
            let cell = tableView.dequeueReusableCell(withType: OptionSelectionTableViewCell.self)
            if let cellViewModel = viewModel?.row(at: indexPath) as? OptionSelectionRowViewModel {
                cell.configure(viewModel: cellViewModel)
            }
            return cell
        case .range:
            let cell = tableView.dequeueReusableCell(withType: FilterTeacherRangeTableViewCell.self)
            if let cellViewModel = viewModel?.row(at: indexPath) as? FilterTeacherRangeTableCellViewModel {
                cell.configure(viewModel: cellViewModel)
            }
            return cell
        default: return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.didSelectRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        44
    }

    
}

extension FilterTeachersViewController {
    func setupKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

// MARK: - Keyboard target events
@objc
extension FilterTeachersViewController {
    private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
           let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double {
            tableViewBottomConstraint.constant = keyboardSize.height
            UIView.animate(withDuration: duration) {
                self.view.layoutIfNeeded()
            }
        }
    }

    private func keyboardWillHide(sender: NSNotification) {
        tableViewBottomConstraint.constant = AppDimension.margin.medium
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}

extension FilterTeachersViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .browse }
}
