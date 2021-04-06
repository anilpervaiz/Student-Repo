//
//  CreateProfileViewController.swift
//  Teachers
//
//  Created by Rahim on 20/03/2021.
//

import UIKit

class CreateProfileViewController: BaseViewController {

    var viewModel: CreateProfileViewModel?

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.registerNibCell(with: CreateProfileSectionTableViewCell.self)
            tableView.tableFooterView = UIView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func didTapCTAButton(_ sender: Any) {
        let viewController = SuccessStateViewController.getInstance()
        viewController.viewModel = ProfileCreatedSuccessStateViewModel(router: SignupSuccessStateRouter(with: self))

        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .coverVertical
        present(viewController, animated: true, completion: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = .default
    }
}

extension CreateProfileViewController: UITableViewDelegate,
                                       UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel?.numberOfRows ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withType: CreateProfileSectionTableViewCell.self)
        if let cellViewModel = viewModel?.section(at: indexPath.section) {
            cell.configureView(viewModel: cellViewModel)
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel?.didTapSection(at: indexPath.section)
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        AppDimension.margin.tiny
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = .clear
        return header
    }
}

extension CreateProfileViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .createProfile }
}
