//
//  UpdateEducationDetailsViewController.swift
//  Students
//
//  Created by Rahim on 10/04/2021.
//

import UIKit

class UpdateEducationDetailsViewController: BaseViewController {

    @IBOutlet weak var gradeTextField: LabelledTextField! {
        didSet {
            gradeTextField.trailingIconStyle = .static(icon: Asset.Media.downArrow.image)
            gradeTextField.isEditable = false
            gradeTextField.isTappable = true
            gradeTextField.onTextFieldTapped = { [weak self] in
                let viewController = BottomSheet.getInstance()
                viewController.modalPresentationStyle = .overCurrentContext
                viewController.modalTransitionStyle = .crossDissolve
                viewController.viewModel = BottomSheetViewModel(with: "Select Grade", items: [
                    BottomSheetListCellViewModel(isSelected: false, title: "Grade 1"),
                    BottomSheetListCellViewModel(isSelected: false, title: "Grade 2"),
                    BottomSheetListCellViewModel(isSelected: true, title: "Grade 3"),
                ])
                viewController.onDismissWithSelection = { [weak self] selected in
                    self?.gradeTextField.inputText = selected ?? ""
                }
                self?.present(viewController, animated: true, completion: nil)
            }
        }
    }
    @IBOutlet weak var schoolTextField: LabelledTextField! {
        didSet {
            schoolTextField.trailingIconStyle = .static(icon: Asset.Media.downArrow.image)
            schoolTextField.isEditable = false
            schoolTextField.isTappable = true
            schoolTextField.onTextFieldTapped = { [weak self] in
                let viewController = BottomSheet.getInstance()
                viewController.modalPresentationStyle = .overCurrentContext
                viewController.modalTransitionStyle = .crossDissolve

                viewController.viewModel = BottomSheetViewModel(with: "Select School", items: [
                    BottomSheetListCellViewModel(isSelected: false, title: "School A"),
                    BottomSheetListCellViewModel(isSelected: false, title: "School B"),
                    BottomSheetListCellViewModel(isSelected: true, title: "School C"),
                ])
                viewController.onDismissWithSelection = { [weak self] selected in
                    self?.schoolTextField.inputText = selected ?? ""
                }
                self?.present(viewController, animated: true, completion: nil)
            }
        }
    }
    @IBOutlet weak var ctaButtonBottomConstraints: NSLayoutConstraint!
    @IBOutlet weak var educationTypeTextField: LabelledTextField!{
        didSet {
            educationTypeTextField.trailingIconStyle = .static(icon: Asset.Media.downArrow.image)
            educationTypeTextField.isEditable = false
            educationTypeTextField.isTappable = true
            educationTypeTextField.onTextFieldTapped = { [weak self] in
                let viewController = BottomSheet.getInstance()
                viewController.modalPresentationStyle = .overCurrentContext
                viewController.modalTransitionStyle = .crossDissolve

                viewController.viewModel = BottomSheetViewModel(with: "Select Education Type", items: [
                    BottomSheetListCellViewModel(isSelected: false, title: "Education Type A"),
                    BottomSheetListCellViewModel(isSelected: false, title: "Education Type B"),
                    BottomSheetListCellViewModel(isSelected: true, title: "Education Type C"),
                ])
                viewController.onDismissWithSelection = { [weak self] selected in
                    self?.educationTypeTextField.inputText = selected ?? ""
                }
                self?.present(viewController, animated: true, completion: nil)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupKeyboardNotification()
    }

    @IBAction func didTapCTAButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension UpdateEducationDetailsViewController {
    func setupKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

// MARK: - Keyboard target events
@objc
extension UpdateEducationDetailsViewController {
    private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
           let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double {
            ctaButtonBottomConstraints.constant = keyboardSize.height + AppDimension.margin.medium
            UIView.animate(withDuration: duration) {
                self.view.layoutIfNeeded()
            }
        }
    }

    private func keyboardWillHide(sender: NSNotification) {
        ctaButtonBottomConstraints.constant = AppDimension.margin.medium
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}

extension UpdateEducationDetailsViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .updatePersonalInformation }
}
