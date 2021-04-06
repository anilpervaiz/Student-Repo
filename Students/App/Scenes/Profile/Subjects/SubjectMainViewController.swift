//
//  SubjectMainViewController.swift
//  Teachers

import Foundation
import UIKit

class SubjectMainViewController: BaseViewController {    
    @IBOutlet weak var subjectNameLabel: UILabel!
    @IBOutlet weak var subjectDetailLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var divider: UIView!
    
    var viewModel: SubjectMainViewModel?
    
    lazy private var subjectDetailViewController: SubjectDetailsViewController = {
        let vc = SubjectDetailsViewController.getInstance()
        vc.viewModel = viewModel?.subjectDetalsViewModel
        return vc
    }()
    
    lazy private var documentsViewController: DocumentsViewController = {
        let vc = DocumentsViewController.getInstance()
        vc.viewModel = viewModel?.subjectDocumentsViewModel
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSegmentedControl()
        updateView()
        configureUI()
    }
    
    private func configureUI() {
        guard let viewModel = viewModel else {
            return
        }
        subjectNameLabel.text = viewModel.subjectName
        subjectDetailLabel.text = viewModel.subjectDetail
    }
    
    @IBAction func segmentValueChanged(_ sender: Any) {
        updateView()
    }
}

// Mark - Private Methods
extension SubjectMainViewController {
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
            remove(asChildViewController: documentsViewController)
            add(asChildViewController: subjectDetailViewController)
        } else {
            remove(asChildViewController: subjectDetailViewController)
            add(asChildViewController: documentsViewController)
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

extension SubjectMainViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .profile }
}
