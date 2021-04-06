//
//  RateAndReviewViewController.swift
//  Teachers
//
//  Created by Rahim on 27/03/2021.
//

import UIKit
import Cosmos

class RateAndReviewViewController: BaseViewController {

    @IBOutlet weak var ctaButtonBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var textRemainigLabel: UILabel!
    @IBOutlet weak var textView: UITextView! {
        didSet {
            textView.delegate = self
        }
    }
    @IBOutlet weak var cosmosView: CosmosView! {
        didSet {
            let width = UIScreen.main.bounds.width - 64
            let margin = (width - (28 * 5)) / 4
            cosmosView.settings.starMargin = Double(margin)
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!

    private let user: User = .mockData

    lazy var closeButton: UIBarButtonItem = {
        UIBarButtonItem(image: Asset.Media.closeIcon.image,
                        style: .plain,
                        target: self,
                        action: #selector(didTapCloseButton))
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        setupKeyboardNotification()
        nameLabel.text = user.name
        profileImageView.image = UIImage(named: user.profileImage)
    }
    
    func setupNavigationBar() {
        navigationItem.leftBarButtonItem = closeButton
    }

    @objc
    func didTapCloseButton() {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func didTapPostButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        profileImageView.circular = true
    }
}

extension RateAndReviewViewController {
    func setupKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

// MARK: - Keyboard target events
@objc
extension RateAndReviewViewController {
    private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
           let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double {
            ctaButtonBottomConstraint.constant = keyboardSize.height + AppDimension.margin.medium
            UIView.animate(withDuration: duration) {
                self.view.layoutIfNeeded()
            }
        }
    }

    private func keyboardWillHide(sender: NSNotification) {
        ctaButtonBottomConstraint.constant = AppDimension.margin.medium
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}

extension RateAndReviewViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        textRemainigLabel.text = "\(textView.text.count)/500"
    }
}

extension RateAndReviewViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .rateAndReview }
}
