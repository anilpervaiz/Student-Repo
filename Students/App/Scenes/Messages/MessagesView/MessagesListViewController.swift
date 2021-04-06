//
//  MessagesListViewController.swift
//  Teachers
//

import UIKit

class MessagesListViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!

    lazy var searchBarButton: UIBarButtonItem = {
        let view = NavigationBarItem()
        view.itemImage = Asset.Media.icSearch.image

        let gesture = UITapGestureRecognizer(target: self, action: #selector(searchTapped))
        view.addGestureRecognizer(gesture)
        return UIBarButtonItem(customView: view)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerNibCell(with: MessageCell.self)
        tableView.separatorStyle = .none
    }
    
    private func setupNavBar() {
        self.navigationItem.rightBarButtonItem = searchBarButton
    }
    
    @objc
    private func searchTapped() {
        print("search tapped on Messages screen")
    }
}

extension MessagesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        MockData.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withType: MessageCell.self)
        cell.configure(from: MockData.messages[indexPath.row])
        return cell
    }
}

extension MessagesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Messages", bundle: nil)
        if let chatViewController = storyboard.instantiateViewController(
            withIdentifier: String(describing: ChatViewController.self)
        ) as? ChatViewController {
            chatViewController.viewModel = MockData.chatViewModelWithParentInfo
            navigationController?.pushViewController(chatViewController, animated: true)
        }
    }
}

extension MessagesListViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .message }
}
