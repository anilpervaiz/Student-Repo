//
//  CreateProfilePersonalInformationViewController.swift
//  Teachers
//
//  Created by Rahim on 21/03/2021.
//

import UIKit

class CreateProfilePersonalInformationViewController: BaseViewController {
    
    @IBOutlet weak var profileImageContainerView: UIView! {
        didSet {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(openImagePickerDrawer))
            profileImageContainerView.addGestureRecognizer(gesture)
        }
    }
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var addProfileImageIconView: UIImageView!
    @IBOutlet weak var firstNameLabel: UILabel! {
        didSet {
            firstNameLabel.text = "Ahmed"
        }
    }
    @IBOutlet weak var lastNameLabel: UILabel! {
        didSet {
            lastNameLabel.text = "Mohammed"
        }
    }
    @IBOutlet weak var genderLabel: UILabel! {
        didSet {
            genderLabel.text = "Male"
        }
    }
    @IBOutlet weak var emailLabel: UILabel! {
        didSet {
            emailLabel.text = "example@example.com"
        }
    }
    @IBOutlet weak var phoneNumberLabel: UILabel! {
        didSet {
            phoneNumberLabel.text = "0000 000 0000"
        }
    }
    @IBOutlet weak var locationLabel: UILabel! {
        didSet {
            locationLabel.text = "Dubai"
        }
    }
    @IBOutlet weak var universityTextField: LabelledTextField! {
        didSet {
            universityTextField.isEditable = false
            universityTextField.isTappable = true
            universityTextField.trailingIconStyle = .static(icon: Asset.Media.downArrow.image)
            universityTextField.onTextFieldTapped = { [weak self] in
                let viewController = BottomSheet.getInstance()
                viewController.modalPresentationStyle = .overCurrentContext
                viewController.modalTransitionStyle = .crossDissolve
                viewController.viewModel = BottomSheetViewModel(with: "Subjects", items: [
                    BottomSheetListCellViewModel(isSelected: false, title: "English"),
                    BottomSheetListCellViewModel(isSelected: false, title: "Science"),
                    BottomSheetListCellViewModel(isSelected: true, title: "Math"),
                ])
                viewController.onDismissWithSelection = { [weak self] selected in
                    self?.universityTextField.inputText = selected ?? ""
                }
                self?.present(viewController, animated: true, completion: nil)
            }
        }
    }
    @IBOutlet weak var educationMajorTextField: LabelledTextField! {
        didSet {
            educationMajorTextField.isEditable = false
            educationMajorTextField.isTappable = true
            educationMajorTextField.trailingIconStyle = .static(icon: Asset.Media.downArrow.image)
            educationMajorTextField.onTextFieldTapped = { [weak self] in
                let viewController = BottomSheet.getInstance()
                viewController.modalPresentationStyle = .overCurrentContext
                viewController.modalTransitionStyle = .crossDissolve
                viewController.viewModel = BottomSheetViewModel(with: "Subjects", items: [
                    BottomSheetListCellViewModel(isSelected: false, title: "English"),
                    BottomSheetListCellViewModel(isSelected: false, title: "Science"),
                    BottomSheetListCellViewModel(isSelected: true, title: "Math"),
                ])
                viewController.onDismissWithSelection = { [weak self] selected in
                    self?.educationMajorTextField.inputText = selected ?? ""
                }
                self?.present(viewController, animated: true, completion: nil)
            }
        }
    }
    @IBOutlet weak var educationDegreeTextField: LabelledTextField! {
        didSet {
            educationDegreeTextField.isEditable = false
            educationDegreeTextField.isTappable = true
            educationDegreeTextField.trailingIconStyle = .static(icon: Asset.Media.downArrow.image)
            educationDegreeTextField.onTextFieldTapped = { [weak self] in
                let viewController = BottomSheet.getInstance()
                viewController.modalPresentationStyle = .overCurrentContext
                viewController.modalTransitionStyle = .crossDissolve
                viewController.viewModel = BottomSheetViewModel(with: "Subjects", items: [
                    BottomSheetListCellViewModel(isSelected: false, title: "English"),
                    BottomSheetListCellViewModel(isSelected: false, title: "Science"),
                    BottomSheetListCellViewModel(isSelected: true, title: "Math"),
                ])
                viewController.onDismissWithSelection = { [weak self] selected in
                    self?.educationDegreeTextField.inputText = selected ?? ""
                }
                self?.present(viewController, animated: true, completion: nil)
            }
        }
    }
    lazy var startDatePicker: CustomDatePickerView = {
        let picker = CustomDatePickerView(viewModel: CustomDatePickerViewModel())
        picker.toolbarDelegate = self

        return picker
    }()

    lazy var endDatePicker: CustomDatePickerView = {
        let picker = CustomDatePickerView(viewModel: CustomDatePickerViewModel())
        picker.toolbarDelegate = self

        return picker
    }()
    @IBOutlet weak var educationStartDateTextField: LabelledTextField! {
        didSet {
            educationStartDateTextField.trailingIconStyle = .static(icon: Asset.Media.calendarIcon.image)
            educationStartDateTextField.inputTextFieldInputPickerView = startDatePicker
            educationStartDateTextField.editTextCursorColor = .init(white: 1, alpha: 0)
        }
    }
    @IBOutlet weak var educationEndDateTextField: LabelledTextField! {
        didSet {
            educationEndDateTextField.trailingIconStyle = .static(icon: Asset.Media.calendarIcon.image)
            educationEndDateTextField.inputTextFieldInputPickerView = endDatePicker
            educationEndDateTextField.editTextCursorColor = .init(white: 1, alpha: 0)
        }
    }
    @IBOutlet weak var speakingLanguageDropDown: LabelledTextField! {
        didSet {
            speakingLanguageDropDown.isEditable = false
            speakingLanguageDropDown.isTappable = true
            speakingLanguageDropDown.trailingIconStyle = .static(icon: Asset.Media.downArrow.image)
            speakingLanguageDropDown.onTextFieldTapped = { [weak self] in
                let viewController = LanguageViewController.getInstance()
                viewController.onDismissWithSelection = { [weak self] selected in
                    self?.speakingLanguageDropDown.inputText = selected.joined(separator: ", ")
                }
                self?.navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }
    @IBOutlet weak var aboutTextView: UITextView!
    @IBOutlet weak var yearOfExpTextField: LabelledTextField! {
        didSet {
            yearOfExpTextField.editTextKeyboardType = .numberPad
            yearOfExpTextField.trailingIconStyle = .text(string: "Years")
        }
    }
    @IBOutlet weak var aboutExperienceTextView: UITextView!

    @IBAction func didTapPrimaryCTAButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        profileImageView.circular = true
        addProfileImageIconView.circular = true
    }
}

@objc
extension CreateProfilePersonalInformationViewController {
    func openImagePickerDrawer() {
        let drawer = ImagePickerOptionSheetViewController.getInstance()
        drawer.onDismissWithSelection = { [weak self] data in
            guard let data = data else { return }
            self?.profileImageView.image = UIImage(data: data)
        }
        drawer.modalPresentationStyle = .overFullScreen
        drawer.modalTransitionStyle = .crossDissolve
        present(drawer, animated: true, completion: nil)
    }
}

extension CreateProfilePersonalInformationViewController: CustomDatePickerViewDelegate {
    func didTapCancelButton() {
        view.endEditing(true)
    }

    func didTapDoneButton(picker: CustomDatePickerView, date: Date) {

        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"

        if picker == startDatePicker {
            educationStartDateTextField.inputText = formatter.string(from: date)
        } else {
            educationEndDateTextField.inputText = formatter.string(from: date)
        }
        view.endEditing(true)
    }
}

extension CreateProfilePersonalInformationViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .createProfile }
}
