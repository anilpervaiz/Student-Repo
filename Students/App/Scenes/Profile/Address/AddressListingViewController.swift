//
//  AddressListingViewController.swift
//  Students
//
//  Created by Rahim on 08/04/2021.
//

import UIKit

class AddressListingViewController: BaseViewController {

    var data: [Address] = Address.mockData

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.registerNibCell(with: AddressListingTableViewCell.self)
            tableView.tableFooterView = UIView()
        }
    }

    lazy var addBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: Asset.Media.circularAddIcon.image, style: .plain, target: self, action: #selector(didTapAddAddressButton(_:)))
        button.tintColor = Asset.Colors.halfBaked.color
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }

    func setupView() {
        title = "Address"
        navigationItem.rightBarButtonItem = addBarButton
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = .default
    }

    @IBAction func didTapAddAddressButton(_ sender: Any) {
        let viewController = AddAddressViewController.getInstance()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension AddressListingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withType: AddressListingTableViewCell.self)
        cell.configure(address: data[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension AddressListingViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .address }
}
