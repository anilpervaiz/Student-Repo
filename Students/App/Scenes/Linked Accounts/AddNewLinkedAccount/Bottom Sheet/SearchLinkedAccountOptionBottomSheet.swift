//
//  SearchLinkedAccountOptionBottomSheet.swift
//  Students
//
//  Created by Rahim on 25/04/2021.
//

import UIKit

class SearchLinkedAccountOptionBottomSheet: UIViewController {

    var navigateToFindByEmail: (() -> Void)?
    var navigateToAddNewAccount: (() -> Void)?

    @IBOutlet weak var findByEmailView: UIView! {
        didSet {
            let tap = UITapGestureRecognizer(target: self, action: #selector(didTapFindByEmail))
            findByEmailView.addGestureRecognizer(tap)
        }
    }
    @IBOutlet weak var newAccountView: UIView! {
        didSet {
            let tap = UITapGestureRecognizer(target: self, action: #selector(didTapNewAccount))
            newAccountView.addGestureRecognizer(tap)
        }
    }
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
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        UIView.animate(withDuration: 1) { [weak self] in
            self?.bottomSheetBottomSpacing.constant = -10
            self?.view.layoutIfNeeded()
        }
    }

    @objc
    func didTapFindByEmail() {
        navigateToFindByEmail?()
        dismissView()
    }

    @objc
    func didTapNewAccount() {
        navigateToAddNewAccount?()
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

extension SearchLinkedAccountOptionBottomSheet: Initializable {
    static var storyboardName: UIStoryboard.Name { .linkedAccount }
}
