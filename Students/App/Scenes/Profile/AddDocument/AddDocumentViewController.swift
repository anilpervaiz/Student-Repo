//
//  AddDocumentViewController.swift
//  Teachers
//
//  Created by Rahim on 03/04/2021.
//

import UIKit

class AddDocumentViewController: UIViewController {

    @IBOutlet weak var uploadFileView: UIView! {
        didSet {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapAddDocumentButton))
            uploadFileView.addGestureRecognizer(gesture)
        }
    }
    @IBOutlet weak var selectCurriculumTextField: LabelledTextField! {
        didSet {
            selectCurriculumTextField.trailingIconStyle = .static(icon: Asset.Media.downArrow.image)
            selectCurriculumTextField.isEditable = false
            selectCurriculumTextField.isTappable = true
            selectCurriculumTextField.onTextFieldTapped = { [weak self] in
                let viewController = BottomSheet.getInstance()
                viewController.modalPresentationStyle = .overCurrentContext
                viewController.modalTransitionStyle = .crossDissolve
                viewController.viewModel = BottomSheetViewModel(with: "Curriculum Type", items: [
                    BottomSheetListCellViewModel(isSelected: false, title: "Kindergarten"),
                    BottomSheetListCellViewModel(isSelected: false, title: "Kindergarten"),
                    BottomSheetListCellViewModel(isSelected: true, title: "Kindergarten"),
                ])
                viewController.onDismissWithSelection = { [weak self] selected in
                    self?.selectCurriculumTextField.inputText = selected ?? ""
                }
                self?.present(viewController, animated: true, completion: nil)
            }
        }
    }
    @IBOutlet weak var selectSubjectTextField: LabelledTextField!{
        didSet {
            selectSubjectTextField.trailingIconStyle = .static(icon: Asset.Media.downArrow.image)
            selectSubjectTextField.isEditable = false
            selectSubjectTextField.isTappable = true
            selectSubjectTextField.onTextFieldTapped = { [weak self] in
                let viewController = BottomSheet.getInstance()
                viewController.modalPresentationStyle = .overCurrentContext
                viewController.modalTransitionStyle = .crossDissolve
                viewController.viewModel = BottomSheetViewModel(with: "Select Subject", items: [
                    BottomSheetListCellViewModel(isSelected: false, title: "Kindergarten"),
                    BottomSheetListCellViewModel(isSelected: false, title: "Kindergarten"),
                    BottomSheetListCellViewModel(isSelected: true, title: "Kindergarten"),
                ])
                viewController.onDismissWithSelection = { [weak self] selected in
                    self?.selectSubjectTextField.inputText = selected ?? ""
                }
                self?.present(viewController, animated: true, completion: nil)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "New Document"
    }

    @objc
    func didTapAddDocumentButton() {

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        uploadFileView.addDashedBorder(color: Asset.Colors.primary.color.cgColor)
    }

    @IBAction func didTapCTAButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension AddDocumentViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .profile }
}
