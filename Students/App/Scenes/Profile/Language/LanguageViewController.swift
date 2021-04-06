//
//  LanguageViewController.swift
//  Teachers
//
//  Created by Rahim on 03/04/2021.
//

import UIKit

class LanguageViewController: UIViewController {

    var onDismissWithSelection: (([String]) -> Void)?

    lazy var backButton: UIBarButtonItem = {
        UIBarButtonItem(image: Asset.Media.backArrow.image,
                        style: .plain,
                        target: self,
                        action: #selector(back))
    }()

    var languages: [LanguageTableCellViewModel] = [

        LanguageTableCellViewModel(title: "English", isSelected: false),
        LanguageTableCellViewModel(title: "Arabic", isSelected: false),
        LanguageTableCellViewModel(title: "Bosanski", isSelected: false),
        LanguageTableCellViewModel(title: "Deutsch", isSelected: false),
        LanguageTableCellViewModel(title: "Dansk", isSelected: false),
        LanguageTableCellViewModel(title: "Eesti", isSelected: false),
        LanguageTableCellViewModel(title: "Espanol", isSelected: false)
    ]

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.registerNibCell(with: LanguageTableViewCell.self)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Speaking Language"
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = backButton
    }

    @objc
    func back() {
        let selectedLanguages = languages.filter { $0.isSelected == true }.map { $0.title }
        onDismissWithSelection?(selectedLanguages)
        self.navigationController?.popViewController(animated: true)
    }
}

extension LanguageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        languages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withType: LanguageTableViewCell.self)
        cell.configure(viewModel: languages[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        languages[indexPath.row].isSelected = !languages[indexPath.row].isSelected
        tableView.reloadData()
    }
}

extension LanguageViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .language }
}
