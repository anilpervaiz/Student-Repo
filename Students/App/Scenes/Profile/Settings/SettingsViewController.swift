//
//  SettingsViewController.swift
//  Teachers
//
//  Created by Rahim on 28/03/2021.
//

import UIKit

class SettingsViewController: UIViewController {

    var settingsViewModel: SettingsViewModel = SettingsViewModel()

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.tableFooterView = UIView()

            tableView.registerNibCell(with: LinkTableViewCell.self)
            tableView.registerNibCell(with: SwitchTableViewCell.self)
            tableView.registerNibHeaderFooterView(with: SettingTableHeaderView.self)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        settingsViewModel.section.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settingsViewModel.numberOfRows(in: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let row = settingsViewModel.row(at: indexPath) {
            switch row.type {
            case .link:
                let cell = tableView.dequeueReusableCell(withType: LinkTableViewCell.self)
                cell.configure(row: row)
                return cell
            case .switch:
                let cell = tableView.dequeueReusableCell(withType: SwitchTableViewCell.self)
                cell.configure(row: row)
                return cell
            }
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withType: SettingTableHeaderView.self)
        header?.titleLabel.text = settingsViewModel.header(for: section)

        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
}

extension SettingsViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .profile }
}
