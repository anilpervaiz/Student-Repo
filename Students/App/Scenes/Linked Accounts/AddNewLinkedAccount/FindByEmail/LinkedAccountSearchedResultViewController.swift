//
//  LinkedAccountSearchedResultViewController.swift
//  Students
//
//  Created by Rahim on 25/04/2021.
//

import UIKit

class LinkedAccountSearchedResultViewController: UIViewController {

    var linkToMyAccount: (() -> Void)?
    var cancelOperation: (() -> Void)?

    var child = LinkedAccount.mockData.first!

    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var childNameLabel: UILabel!
    @IBOutlet weak var childProfileImageView: UIImageView!
    @IBOutlet weak var bottomSheetBottomSpacing: NSLayoutConstraint!
    @IBOutlet weak var topDismissLayer: UIView!
    @IBOutlet weak var bottomSheetView: UIView! {
        didSet {
            bottomSheetView.cornerRadius = 8
        }
    }

    var onDismissWithSelection: ((Data?) -> Void)?

    override func viewDidLoad() {
        setupViewGesture()
        setupData()
    }

    func setupData() {
        ratingLabel.text = child.rating
        childProfileImageView.image = UIImage(named: child.profileImage)
        childNameLabel.text = child.name
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        UIView.animate(withDuration: 1) { [weak self] in
            self?.bottomSheetBottomSpacing.constant = -10
            self?.view.layoutIfNeeded()
        }
    }

    @IBAction func didTapCancelButton(_ sender: Any) {
        cancelOperation?()
        dismissView()
    }

    @IBAction func didTapLinkToMyAccountButton(_ sender: Any) {
        linkToMyAccount?()
        dismissView()
    }

    func setupViewGesture() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                 action: #selector(dismissView))
        topDismissLayer.addGestureRecognizer(tap)
    }

    @objc
    func dismissView() {
        bottomSheetBottomSpacing.constant -= view.frame.height * 0.75
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        } completion: { [weak self] _ in
            self?.dismiss(animated: true, completion: nil)
        }
    }
}

extension LinkedAccountSearchedResultViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .linkedAccount }
}
