//
//  UpdatePersonalInformationViewController.swift
//  Students
//
//  Created by Rahim on 10/04/2021.
//

import UIKit
import FlagPhoneNumber

class UpdatePersonalInformationViewController: BaseViewController {

    var userType: UserType?

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

    lazy var closeButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: Asset.Media.close.image,
                        style: .plain,
                        target: self,
                        action: #selector(closeNumberPickerView))
        button.tintColor = Asset.Colors.gray.color
        return button
    }()

    @IBOutlet weak var phoneNumberTextField: FPNTextField! {
        didSet {
            phoneNumberTextField.displayMode = .list
            phoneNumberTextField.flagButtonSize = CGSize(width: 36, height: 36)
            phoneNumberTextField.textColor = Asset.Colors.gray.color
            phoneNumberTextField.placeHolderColor = Asset.Colors.lightGray.color
            phoneNumberTextField.trailingCodeImage = Asset.Media.downArrow.image
            phoneNumberTextField.font = .init(commonFont: PoppinsFontStyle.regular, size: 16)
            phoneNumberTextField.delegate = self
        }
    }
    @IBOutlet weak var locationTextField: LabelledTextField! {
        didSet {
            locationTextField.trailingIconStyle = .static(icon: Asset.Media.downArrow.image)
            locationTextField.inputTextFieldInputPickerView = itemPickerView
            locationTextField.editTextCursorColor = .init(white: 1, alpha: 0)
        }
    }
    @IBOutlet weak var emailTextField: LabelledTextField!
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
        title = "Personal Information"
        navigationController?.navigationBar.barStyle = .default
    }
}

extension UpdatePersonalInformationViewController: FPNTextFieldDelegate {
    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {}

    func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {}

    func fpnDisplayCountryList() {
        let listController: FPNCountryListViewController = FPNCountryListViewController(style: .grouped)
        let navigationViewController = BaseNavigationController(rootViewController: listController)

        navigationViewController.navigationBar.tintColor = Asset.Colors.gray.color

        listController.title = "Countries"

        listController.setup(repository: phoneNumberTextField.countryRepository)
        listController.didSelect = { [weak self] country in
        self?.phoneNumberTextField.setFlag(countryCode: country.code)
        }

        listController.navigationItem.leftBarButtonItem = closeButton

        self.present(navigationViewController, animated: true, completion: nil)
    }

    @objc
    func closeNumberPickerView() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension UpdatePersonalInformationViewController {
    @IBAction func didTapVerifyNumberButton(_ sender: Any) {
        let viewModel = NumberVerificationViewModel(userType: userType)
        let viewController = NumberVerificationViewController.getInstance()
        viewController.viewModel = viewModel
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension UpdatePersonalInformationViewController {
    func setupKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

// MARK: - Keyboard target events
@objc
extension UpdatePersonalInformationViewController {
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

extension UpdatePersonalInformationViewController: ItemPickerViewDelegate {
    func didTapCancelButton() {
        self.view.endEditing(true)
    }

    func didTapDoneButton(with selectedItem: PickerItemModel?) {
        locationTextField.inputText = selectedItem?.title
        self.view.endEditing(true)
    }
}

extension UpdatePersonalInformationViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .updatePersonalInformation }
}
