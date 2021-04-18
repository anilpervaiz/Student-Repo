//
//  BottomSheetView.swift
//  Teachers
//
//  Created by Rahim on 20/03/2021.
//

import UIKit

class BottomSheet: UIViewController {
    @IBOutlet weak var bottomSheetBottomSpacing: NSLayoutConstraint!
    @IBOutlet weak var topDismissLayer: UIView!
    @IBOutlet weak var bottomSheetView: UIView! {
        didSet {
            bottomSheetView.cornerRadius = 8
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.registerNibCell(with: BottomSheetListCell.self)
            tableView.tableFooterView = UIView()
        }
    }
    @IBOutlet weak var ctaButton: PrimaryCTAButton!

    var onDismissWithSelection: ((String?) -> Void)?
    var viewModel: BottomSheetViewModel? {
        didSet {
            setupView()
        }
    }
    override func viewDidLoad() {
        setupViewGesture()
        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        UIView.animate(withDuration: 1) { [weak self] in
            self?.bottomSheetBottomSpacing.constant = -10
            self?.view.layoutIfNeeded()
        }
    }

    func setupViewGesture() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                 action: #selector(dismissView))
        topDismissLayer.addGestureRecognizer(tap)
    }

    @IBAction func didTapCTAButton(_ sender: Any) {
        dismissView()
    }

    @objc
    func dismissView() {
        bottomSheetBottomSpacing.constant -= view.frame.height * 0.75
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        } completion: { [weak self] _ in
            self?.onDismissWithSelection?(self?.viewModel?.selectedItem)
            self?.dismiss(animated: true, completion: nil)
        }
    }

    func setupView() {
        titleLabel?.text = viewModel?.title ?? ""
        tableView?.reloadData()
    }
}

extension BottomSheet: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.numberOfItems ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withType: BottomSheetListCell.self)
        if let cellViewModel = viewModel?.item(at: indexPath.row) {
            cell.configure(with: cellViewModel)
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel?.didSelectItem(at: indexPath.row)
        tableView.reloadData()
    }
}

extension BottomSheet: Initializable {
    static var storyboardName: UIStoryboard.Name { .bottomSheet }
}
