//
//  SignupPersonalInformationViewController.swift
//  Teachers
//
//  Created by Rahim on 16/03/2021.
//

import UIKit
import Combine

class SignupPersonalInformationViewController: BaseViewController {

    private lazy var itemPickerView: ItemPickerView! = {
        var pickerView = ItemPickerView()
        pickerView.toolbarDelegate = self
        pickerView.viewModel = ItemPickerViewModel(data: [
            LocationPickerViewModel(title: "Pakistan", key: "pakistan"),
            LocationPickerViewModel(title: "Dubai", key: "dubai"),
            LocationPickerViewModel(title: "India", key: "india"),
        ])
        return pickerView
    }()

    @IBOutlet weak var locationTextField: LabelledTextField! {
        didSet {
            locationTextField.trailingIconStyle = .static(icon: Asset.Media.downArrow.image)
            locationTextField.inputTextFieldInputPickerView = itemPickerView
            locationTextField.editTextCursorColor = .init(white: 1, alpha: 0)
        }
    }
    @IBOutlet weak var firstNameTextField: LabelledTextField! {
        didSet {
            firstNameTextField.formatValidator = FormatValidator(regex: "^[\\p{L}'-][\\p{L}' -]{0,50}$", invalidFormatError: "Please enter a valid name")
            firstNameTextField.updateStateTo(isError: true, error: "Please enter a valid name")
        }
    }

    @IBOutlet weak var ctaButtonBottomConstraint: NSLayoutConstraint!
    lazy var optionSelectionView: OptionSelectionView<GenderOption> = {
        let view = OptionSelectionView<GenderOption>().preparedForAutolayout()
        view.configure(with: GenderOption.allCases, title: "Gender")
        return view
    }()

    @IBOutlet weak var optionSelectionContainerView: UIView! {
        didSet {
            optionSelectionContainerView.addSubview(optionSelectionView)
            optionSelectionView.fillSuperview()
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle { .default }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupKeyboardNotification()
        navigationController?.navigationBar.barStyle = .default
    }
}

extension SignupPersonalInformationViewController {
    func setupKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

// MARK: - Keyboard target events
@objc
extension SignupPersonalInformationViewController {
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

extension SignupPersonalInformationViewController: ItemPickerViewDelegate {
    func didTapCancelButton() {
        self.view.endEditing(true)
    }

    func didTapDoneButton(with selectedItem: PickerItemModel?) {
        locationTextField.inputText = selectedItem?.title
        self.view.endEditing(true)
    }
}

extension SignupPersonalInformationViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .signup }
}


enum GenderOption: String,
                   OptionCaseIterable {
    case male = "male"
    case female = "female"

    var title: String {
        switch self {
        case .male: return "Male"
        case .female: return "Female"
        }
    }

    var imageName: String {
        switch self {
        case .male: return Asset.Media.male.name
        case .female: return Asset.Media.female.name
        }
    }
}
