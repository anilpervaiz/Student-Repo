//
//  NotificationViewController.swift
//  Teachers
//
//  Created by Rahim on 24/03/2021.
//

import UIKit

class NotificationViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.registerNibCell(with: NotificationTableViewCell.self)
            tableView.tableFooterView = UIView()
        }
    }
}

extension NotificationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Notification.mockData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withType: NotificationTableViewCell.self)
        cell.configure(notification: Notification.mockData[indexPath.row])
        return cell
    }
}

extension NotificationViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .notification }
}
