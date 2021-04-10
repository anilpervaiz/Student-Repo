//
//  MyFilteredScheduleViewController.swift
//  Students
//
//  Created by Rahim on 10/04/2021.
//

import UIKit

class MyFilteredScheduleViewController: BaseViewController {
    
    @IBOutlet weak var segmentControl: UISegmentedControl! {
        didSet {
            setupSegmentedControl()
        }
    }
    var viewModel: MyFilteredScheduleViewModel?
    @IBOutlet weak var dividerView: UIView!
    lazy var scheduleListingViewController: ScheduleListingViewController = {
        let viewController = ScheduleListingViewController.getInstance()
        viewController.viewModel = viewModel?.scheduleListingViewModel
        return viewController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        add(asChildViewController: scheduleListingViewController)
        setupNavigationBar()
    }

    func setupNavigationBar() {
        title = "My Sessions"
    }

    func setupSegmentedControl() {
        let notSelectedAttributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font : UIFont(name: PoppinsFontStyle.medium.name, size: 12) as Any,
            NSAttributedString.Key.foregroundColor : Asset.Colors.gray.color
        ]
        let selectedAttributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font : UIFont(name: PoppinsFontStyle.semiBold.name, size: 12) as Any,
            NSAttributedString.Key.foregroundColor : Asset.Colors.aquaMarine.color
        ]

        segmentControl.setTitleTextAttributes(notSelectedAttributes, for: .normal)
        segmentControl.setTitleTextAttributes(selectedAttributes, for: .selected)
    }

    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChild(viewController)

        // Add Child View as Subview
        let childView: UIView! = viewController.view
        view.addSubview(childView)

        // Configure Child View
        childView.preparedForAutolayout()
        childView.fillSuperviewHorizontally()
        NSLayoutConstraint.activate([
            childView.topAnchor.constraint(equalTo: dividerView.bottomAnchor,
                                           constant: 16),
            childView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        // Notify Child View Controller
        viewController.didMove(toParent: self)
    }

    @IBAction func onSegmentValueChanged(_ sender: Any) {
        viewModel?.didUpdateSegment(to: segmentControl.selectedSegmentIndex)
    }
}

extension MyFilteredScheduleViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .schedule }
}
