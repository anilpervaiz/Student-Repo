//
//  LinkedAccountListViewController.swift
//  Students
//
//  Created by Rahim on 25/04/2021.
//

import UIKit

class LinkedAccountListViewController: BaseViewController {

    var viewModel: LinkedAccountListViewModel!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.tableFooterView = UIView()
            tableView.registerNibCell(with: LinkedAccountTableViewCell.self)
        }
    }

    lazy var chatNavigationBarButton: UIBarButtonItem = {
        let view = NavigationBarItem()
        view.itemImage = Asset.Media.chat.image

        let barButton = UIBarButtonItem(customView: view)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapChatButton))
        view.addGestureRecognizer(gesture)
        return barButton
    }()

    lazy var addAccountNavigationBarButton: UIBarButtonItem = {
        let view = NavigationBarItem()
        view.itemImage = Asset.Media.addCircular.image

        let barButton = UIBarButtonItem(customView: view)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapAddAccountButton))
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
    }

    func setupNavigationBar() {
        setLeftAlignNavBarTitle(with: "Sub Accounts",
                                font: .init(commonFont: PoppinsFontStyle.semiBold, size: 20),
                                textColor: Asset.Colors.darkBlue.color)
        navigationItem.rightBarButtonItems = [notificationNavigationBarButton, chatNavigationBarButton, addAccountNavigationBarButton]
    }
}

extension LinkedAccountListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItems
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withType: LinkedAccountTableViewCell.self)
        cell.configure(with: viewModel.linkedAccount(at: indexPath.row))

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.didTapLinkedAccount(at: indexPath.row)
    }
}

extension LinkedAccountListViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .linkedAccount }
}

@objc
extension LinkedAccountListViewController {
    func didTapNotificationButton() {
        viewModel?.didTapNotificationButton()
    }

    func didTapAddAccountButton() {
        viewModel?.didTapAddAccountButton()
    }

    func didTapChatButton() {
        viewModel?.didTapChatButton()
    }
}
