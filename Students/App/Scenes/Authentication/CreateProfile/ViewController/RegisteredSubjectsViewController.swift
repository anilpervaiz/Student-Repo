//
//  RegisteredSubjectsViewController.swift
//  Teachers
//
//  Created by Rahim on 20/03/2021.
//

import UIKit

class RegisteredSubjectsViewController: BaseViewController {

    @IBOutlet weak var illustrationImageView: UIImageView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.tableFooterView = UIView()
            tableView.registerNibCell(with: RegisteredSubjectTableViewCell.self)
        }
    }
    lazy var addBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: Asset.Media.circularAddIcon.image, style: .plain, target: self, action: #selector(didTapAddSubjectButton(_:)))
        button.tintColor = Asset.Colors.halfBaked.color
        return button
    }()

    var viewModel: RegisteredSubjectsViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        setupView()
        viewModel?.setupView()
    }

    func setupView() {
        title = "Subjects"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = .default
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        illustrationImageView.circular = true
    }

    func bindViewModel() {
        viewModel?.output = { [weak self] output in
            switch output {
            case .showEmptyState:
                self?.contentView.isHidden = true
                self?.emptyView.isHidden = false
                self?.navigationItem.rightBarButtonItem = nil
            case .showNormalState:
                self?.contentView.isHidden = false
                self?.emptyView.isHidden = true
                self?.navigationItem.rightBarButtonItem = self?.addBarButton
            case .reloadData:
                self?.tableView.reloadData()
            }
        }
    }

    @IBAction func didTapAddSubjectButton(_ sender: Any) {
        let viewController = AddSubjectViewController.getInstance()
        viewController.viewModel = AddSubjectViewModel(onSubjectSuccessfullyAdded: { [weak self] subject in
            self?.viewModel?.didAddSubject(subject: subject)
        })

        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

extension RegisteredSubjectsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.numberOfItems ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withType: RegisteredSubjectTableViewCell.self)

        if let subject = viewModel?.subject(at: indexPath.row) {
            cell.configure(subject: subject)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension RegisteredSubjectsViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .createProfile }
}
