//
//  AddPaymentMethodViewController.swift
//  Students
//
//  Created by Rahim on 10/04/2021.
//

import UIKit

class AddPaymentMethodViewController: BaseViewController {

    private var isDefaultPayment = false {
        didSet {
            if isDefaultPayment {
                defaultPaymentCheckboxImageView.image = Asset.Media.checkboxSelected.image
                defaultPaymentCheckboxImageView.tintColor = Asset.Colors.halfBaked.color
            } else {
                defaultPaymentCheckboxImageView.image = Asset.Media.checkbox.image
            }

        }
    }
    @IBOutlet weak var defaultPaymentCheckboxImageView: UIImageView!
    @IBOutlet weak var isDefaultPaymentView: UIView! {
        didSet {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapDefaultPaymentCheckbox))
            isDefaultPaymentView.addGestureRecognizer(gesture)
        }
    }
    @IBOutlet weak var ctaButtonBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var cardNumberTextField: LabelledTextField! {
        didSet {
            cardNumberTextField.editTextKeyboardType = .numberPad
        }
    }

    lazy var datePicker: CustomDatePickerView = {
        let picker = CustomDatePickerView(viewModel: CustomDatePickerViewModel())
        picker.toolbarDelegate = self

        return picker
    }()

    @IBOutlet weak var expiryDateTextField: LabelledTextField! {
        didSet {
            expiryDateTextField.inputTextFieldInputPickerView = datePicker
            expiryDateTextField.editTextCursorColor = .init(white: 1, alpha: 0)
        }
    }
    @IBOutlet weak var CVVTextField: LabelledTextField! {
        didSet {
            CVVTextField.editTextKeyboardType = .numberPad
        }
    }
    @IBOutlet weak var cardHolderNameTextField: LabelledTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "New Payment Method"
        navigationController?.navigationBar.barStyle = .default
    }

    @IBAction func didTapCTAButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    @objc
    func didTapDefaultPaymentCheckbox() {
        isDefaultPayment = !isDefaultPayment
    }
}

extension AddPaymentMethodViewController {
    func setupKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

// MARK: - Keyboard target events
@objc
extension AddPaymentMethodViewController {
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

extension AddPaymentMethodViewController: CustomDatePickerViewDelegate {
    func didTapCancelButton() {
        view.endEditing(true)
    }

    func didTapDoneButton(picker: CustomDatePickerView, date: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/YY"

        expiryDateTextField.inputText = formatter.string(from: date)
        view.endEditing(true)
    }
}

extension AddPaymentMethodViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .profile }
}
