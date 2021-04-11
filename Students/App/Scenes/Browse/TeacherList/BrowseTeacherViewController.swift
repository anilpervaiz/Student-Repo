//
//  BrowseTeacherViewController.swift
//  Students
//
//  Created by Rahim on 08/04/2021.
//

import UIKit

class BrowseTeacherViewController: BaseViewController {

    @IBOutlet weak var filterTextField: LabelledTextField! {
        didSet {
            filterTextField.placeholderText = "Find teachers, subjects"
            filterTextField.leadingImage = Asset.Media.icSearch.image
            filterTextField.trailingIconStyle = .static(icon: Asset.Media.filter.image)
            filterTextField.didTapTrailingView = { [weak self] in
                self?.viewModel?.didTapFilterButton()
            }
        }
    }
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.registerNibCell(with: WishlistTableViewCell.self)
        }
    }
    var viewModel: BrowseTeacherViewModel?

    lazy var chatNavigationBarButton: UIBarButtonItem = {
        let view = NavigationBarItem()
        view.itemImage = Asset.Media.chat.image

        let barButton = UIBarButtonItem(customView: view)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapChatButton))
        view.addGestureRecognizer(gesture)
        return barButton
    }()

    lazy var notificationNavigationBarButton: UIBarButtonItem = {
        let view = NavigationBarItem()
        view.itemImage = Asset.Media.notification.image
        view.badgeCount = 3

        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapNotificationButton))
        view.addGestureRecognizer(gesture)
        return UIBarButtonItem(customView: view)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        navigationController?.navigationBar.barStyle = .default
    }

    func setupNavigationBar() {
        setLeftAlignNavBarTitle(with: "Welcome Back, Ahmed!")

        navigationItem.rightBarButtonItems = [notificationNavigationBarButton, chatNavigationBarButton]
    }
}

@objc
extension BrowseTeacherViewController {
    func didTapNotificationButton() {
        viewModel?.didTapNotificationButton()
    }

    func didTapChatButton() {
        viewModel?.didTapChatButton()
    }
}

extension BrowseTeacherViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.numberOfRows ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withType: WishlistTableViewCell.self)
        if let cellVM = viewModel?.session(at: indexPath.row) {
            cell.configure(with: cellVM)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel?.didSelectSession(at: indexPath.row)
    }
}

extension BrowseTeacherViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .browse }
}
