//
//  EditProfileViewController.swift
//  Students
//
//  Created by Rahim on 10/04/2021.
//

import UIKit

class EditProfileViewController: BaseViewController {

    @IBOutlet weak var profileImageContainerView: UIView! {
        didSet {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(openImagePickerDrawer))
            profileImageContainerView.addGestureRecognizer(gesture)
        }
    }
    @IBOutlet weak var gradeLabel: UILabel! {
        didSet {
            gradeLabel.text = "Grade 11"
        }
    }
    @IBOutlet weak var educationTypeLabel: UILabel! {
        didSet {
            educationTypeLabel.text = "Middle School"
        }
    }
    @IBOutlet weak var schoolNameLabel: UILabel! {
        didSet {
            schoolNameLabel.text = "Springdales School, Dubai"
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
    @IBAction func didTapPrimaryCTAButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        profileImageView.circular = true
        addProfileImageIconView.circular = true
    }
    @IBAction func editPersonalInformation(_ sender: Any) {
        let viewController = UpdatePersonalInformationViewController.getInstance()
        navigationController?.pushViewController(viewController, animated: true)
    }


    @IBAction func editEducationInformation(_ sender: Any) {
        let viewController = UpdateEducationDetailsViewController.getInstance()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

@objc
extension EditProfileViewController {
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

extension EditProfileViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .updatePersonalInformation }
}
