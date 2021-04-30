//
//  UpdateSubjectsViewController.swift
//  Students
//
//  Created by Rahim on 10/04/2021.
//

import UIKit

class UpdateSubjectsViewController: BaseViewController {
    var viewModel: AddStudyingSubjectViewModel = AddStudyingSubjectViewModel()

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.registerNibCell(with: AddSubjectTableViewCell.self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Subjects"
        viewModel.setupData()
    }

    @IBAction func didTapCTAButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension UpdateSubjectsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfRows
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withType: AddSubjectTableViewCell.self)
        cell.configure(viewModel: viewModel.cellViewModel(at: indexPath.section))

        return cell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        4
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectCell(at: indexPath.section)
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadData()
    }
}

extension UpdateSubjectsViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .profile }
}
