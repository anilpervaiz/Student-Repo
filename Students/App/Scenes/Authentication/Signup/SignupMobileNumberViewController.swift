//
//  SignupMobileNumberViewController.swift
//  Teachers
//
//  Created by Rahim on 17/03/2021.
//

import UIKit
import FlagPhoneNumber

class SignupMobileNumberViewController: BaseViewController {

    lazy var closeButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: Asset.Media.close.image,
                        style: .plain,
                        target: self,
                        action: #selector(closeNumberPickerView))
        button.tintColor = Asset.Colors.gray.color
        return button
    }()

    @IBOutlet weak var ctaButtonBottomConstraint: NSLayoutConstraint!
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

    override func viewDidLoad() {
        super.viewDidLoad()

        setupKeyboardNotification()
    }
}

extension SignupMobileNumberViewController: FPNTextFieldDelegate {
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

extension SignupMobileNumberViewController {
    @IBAction func didTapVerifyNumberButton(_ sender: Any) {
        
    }
}

extension SignupMobileNumberViewController {
    func setupKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

// MARK: - Keyboard target events
@objc
extension SignupMobileNumberViewController {
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

extension SignupMobileNumberViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .signup }
}
