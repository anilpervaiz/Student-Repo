//
//  RequestListingViewController.swift
//  Teachers
//
//  Created by Rahim on 24/03/2021.
//

import UIKit

class RequestListingViewController: BaseViewController {

    var viewModel: RequestListingViewModel?
    var onRequestTapped: ((Session) -> Void)?

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

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.registerNibCell(with: SessionTableViewCell.self)
            tableView.tableFooterView = UIView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        navigationController?.navigationBar.barStyle = .default
    }

    func setupNavigationBar() {
        setLeftAlignNavBarTitle(with: "Requests",
                                font: .init(commonFont: PoppinsFontStyle.semiBold, size: 20),
                                textColor: Asset.Colors.darkBlue.color)
        navigationItem.rightBarButtonItems = [notificationNavigationBarButton, chatNavigationBarButton]
    }
}

extension RequestListingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Session.mockData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withType: SessionTableViewCell.self)
        cell.configure(session: Session.mockData[indexPath.row])

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let onRequestTapped = onRequestTapped {
            onRequestTapped(Session.mockData[indexPath.row])
        } else {
            viewModel?.didTapRequest(at: indexPath.row)
        }
    }
}


@objc
extension RequestListingViewController {
    func didTapNotificationButton() {
        viewModel?.didTapNotificationButton()
    }

    func didTapChatButton() {
        viewModel?.didTapChatButton()
    }
}

extension RequestListingViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .requests }
}
