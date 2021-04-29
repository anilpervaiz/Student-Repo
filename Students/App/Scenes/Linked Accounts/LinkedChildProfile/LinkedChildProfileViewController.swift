//
//  LinkedChildProfileViewController.swift
//  Students
//
//  Created by Rahim on 25/04/2021.
//

import UIKit

class LinkedChildProfileViewController: BaseViewController {

    var viewModel: LinkedChildProfileViewModel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var childNameLabel: UILabel!
    @IBOutlet weak var childProfileImageView: UIImageView!
    @IBOutlet weak var segmentControl: UISegmentedControl! {
        didSet {
            setupSegmentedControl()
        }
    }
    @IBOutlet weak var containerView: UIView!

    private lazy var sessionsController: UIViewController = {
        let viewController = LinkedAccountSessionViewController.getInstance()
        return viewController
    }()
    private lazy var sessionRequestController: UIViewController = {
        let viewController = RequestListingSceneBuilder().makeViewController { [weak self] session in
            self?.viewModel.didTapSessionRequest(session: session)
        }
        viewController.isNavigationBarHidden = true
        return viewController
    }()
    private lazy var reviewViewController = ReviewsViewController.getInstance()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    func setupView() {
        childNameLabel.text = viewModel.child.name
        childProfileImageView.image = UIImage(named: viewModel.child.profileImage)

        add(asChildViewController: sessionRequestController)
        add(asChildViewController: reviewViewController)
        add(asChildViewController: sessionsController)

        onSegmentValueChanged(segmentControl)
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
        containerView.addSubview(childView)

        // Configure Child View
        childView.preparedForAutolayout()
        childView.fillSuperview()

        // Notify Child View Controller
        viewController.didMove(toParent: self)
    }

    @IBAction func onSegmentValueChanged(_ sender: UISegmentedControl) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            reviewViewController.view.isHidden = true
            sessionRequestController.view.isHidden = false
            sessionsController.view.isHidden = true
        case 1:
            reviewViewController.view.isHidden = true
            sessionRequestController.view.isHidden = true
            sessionsController.view.isHidden = false
        case 2:
            reviewViewController.view.isHidden = false
            sessionRequestController.view.isHidden = true
            sessionsController.view.isHidden = true
        default: break
        }
    }

    @IBAction func didTapEditButton(_ sender: Any) {
    }
    @IBAction func didTapDeleteButton(_ sender: Any) {
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        childProfileImageView.circular = true
        editButton.circular = true
        deleteButton.circular = true
    }
}

extension LinkedChildProfileViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .linkedChildProfile }
}
