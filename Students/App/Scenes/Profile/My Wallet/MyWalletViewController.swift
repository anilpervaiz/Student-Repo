//
//  MyWalletViewController.swift
//  Teachers
//
//  Created by Rahim on 31/03/2021.
//

import UIKit

class MyWalletViewController: BaseViewController {
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var divider: UIView!

    var viewModel: SubjectMainViewModel?

    lazy private var transactionViewController: MyTransactionsViewController = {
        let vc = MyTransactionsViewController.getInstance()
        return vc
    }()

    lazy private var myEarningViewController: MyEarningsViewController = {
        let vc = MyEarningsViewController.getInstance()
        return vc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSegmentedControl()
        updateView()

        title = "My Wallet"
    }

    @IBAction func segmentValueChanged(_ sender: Any) {
        updateView()
    }
}

// Mark - Private Methods
extension MyWalletViewController {
    func setupSegmentedControl() {
        let notSelectedAttributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font : UIFont(name: PoppinsFontStyle.medium.name, size: 12) as Any,
            NSAttributedString.Key.foregroundColor : Asset.Colors.gray.color
        ]
        let selectedAttributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font : UIFont(name: PoppinsFontStyle.semiBold.name, size: 12) as Any,
            NSAttributedString.Key.foregroundColor : Asset.Colors.aquaMarine.color
        ]

        segmentedControl.setTitleTextAttributes(notSelectedAttributes, for: .normal)
        segmentedControl.setTitleTextAttributes(selectedAttributes, for: .selected)
    }

    private func updateView() {
        if segmentedControl.selectedSegmentIndex == 0 {
            remove(asChildViewController: transactionViewController)
            add(asChildViewController: myEarningViewController)
        } else {
            remove(asChildViewController: myEarningViewController)
            add(asChildViewController: transactionViewController)
        }
    }

    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChild(viewController)

        // Add Child View as Subview
        let childView: UIView! = viewController.view
        view.addSubview(childView)

        // Configure Child View
        childView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            childView.topAnchor.constraint(equalTo: divider.bottomAnchor),
            childView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            childView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            childView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        // Notify Child View Controller
        viewController.didMove(toParent: self)
    }

    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParent: nil)

        // Remove Child View From Superview
        viewController.view.removeFromSuperview()

        // Notify Child View Controller
        viewController.removeFromParent()
    }
}

extension MyWalletViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .profile }
}
