//
//  BillingInformationViewController.swift
//  Teachers
//
//  Created by Rahim on 03/04/2021.
//

import UIKit

class BillingInformationViewController: UIViewController {

    @IBOutlet weak var currencyTextField: LabelledTextField! {
        didSet {
            currencyTextField.trailingIconStyle = .static(icon: Asset.Media.downArrow.image)
            currencyTextField.isEditable = false
            currencyTextField.isTappable = true
            currencyTextField.onTextFieldTapped = { [weak self] in
                let viewController = BottomSheet.getInstance()
                viewController.modalPresentationStyle = .overCurrentContext
                viewController.modalTransitionStyle = .crossDissolve
                viewController.viewModel = BottomSheetViewModel(with: "Select Currency", items: [
                    BottomSheetListCellViewModel(isSelected: false, title: "AED"),
                    BottomSheetListCellViewModel(isSelected: false, title: "USD"),
                    BottomSheetListCellViewModel(isSelected: true, title: "PKR"),
                ])
                viewController.onDismissWithSelection = { [weak self] selected in
                    self?.currencyTextField.inputText = selected ?? ""
                }
                self?.present(viewController, animated: true, completion: nil)
            }
        }
    }
    @IBOutlet weak var accountNumberTextField: LabelledTextField!
    @IBOutlet weak var accountHolderNameTextField: LabelledTextField!
    @IBOutlet weak var ibanTextField: LabelledTextField!
    @IBOutlet weak var ctaButtonBottomSpacing: NSLayoutConstraint!
    @IBOutlet weak var bankNameTextField: LabelledTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Billing Information"
        setupKeyboardNotification()
    }

    @IBAction func didTapSaveButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension BillingInformationViewController {
    func setupKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

// MARK: - Keyboard target events
@objc
extension BillingInformationViewController {
    private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
           let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double {
            ctaButtonBottomSpacing.constant = keyboardSize.height + AppDimension.margin.medium
            UIView.animate(withDuration: duration) {
                self.view.layoutIfNeeded()
            }
        }
    }

    private func keyboardWillHide(sender: NSNotification) {
        ctaButtonBottomSpacing.constant = AppDimension.margin.medium
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}

extension BillingInformationViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .billingInformation }
}
