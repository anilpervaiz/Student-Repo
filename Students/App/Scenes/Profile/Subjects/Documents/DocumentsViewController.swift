//
//  DocumentsViewController.swift
//  Teachers

import Foundation
import UIKit

class DocumentsViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.tableFooterView = UIView()
            tableView.registerNibCell(with: DocumentCell.self)
        }
    }
    
    var viewModel: DocumentsViewModel?
}

extension DocumentsViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .profile }
}

extension DocumentsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.numberOfItems ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell = tableView.dequeueReusableCell(withType: DocumentCell.self)
        cell.selectionStyle = .none
        if let cellVM = viewModel?.documentViewModel(at: indexPath.row) {
            (cell as? DocumentCell)?.configure(with: cellVM)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel?.didTapRow(at: indexPath.row)
    }
}

