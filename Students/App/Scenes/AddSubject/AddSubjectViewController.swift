//
//  AddSubjectViewController.swift
//  Teachers
//
//  Created by Rahim on 21/03/2021.
//

import UIKit

class AddSubjectViewController: BaseViewController {

    var viewModel: AddSubjectViewModel?
    @IBOutlet weak var educationTypeLabel: LabelledTextField! {
        didSet {
            educationTypeLabel.trailingIconStyle = .static(icon: Asset.Media.downArrow.image)
            educationTypeLabel.onTextFieldTapped = { [weak self] in
                let viewController = BottomSheet.getInstance()
                viewController.modalPresentationStyle = .overCurrentContext
                viewController.modalTransitionStyle = .crossDissolve
                viewController.viewModel = BottomSheetViewModel(with: "Education Type", items: [
                    BottomSheetListCellViewModel(isSelected: false, title: "Kindergarten"),
                    BottomSheetListCellViewModel(isSelected: false, title: "Kindergarten"),
                    BottomSheetListCellViewModel(isSelected: true, title: "Kindergarten"),
                ])
                viewController.onDismissWithSelection = { [weak self] selected in
                    self?.educationTypeLabel.inputText = selected ?? ""
                }
                self?.present(viewController, animated: true, completion: nil)
            }
        }
    }
    @IBOutlet weak var curriculumLabel: LabelledTextField! {
        didSet {
            curriculumLabel.trailingIconStyle = .static(icon: Asset.Media.downArrow.image)
            curriculumLabel.onTextFieldTapped = { [weak self] in
                let viewController = BottomSheet.getInstance()
                viewController.modalPresentationStyle = .overCurrentContext
                viewController.modalTransitionStyle = .crossDissolve
                viewController.viewModel = BottomSheetViewModel(with: "Curriculum", items: [
                    BottomSheetListCellViewModel(isSelected: false, title: "Basic"),
                    BottomSheetListCellViewModel(isSelected: false, title: "Intermediate"),
                    BottomSheetListCellViewModel(isSelected: true, title: "Advance"),
                ])
                viewController.onDismissWithSelection = { [weak self] selected in
                    self?.curriculumLabel.inputText = selected ?? ""
                }
                self?.present(viewController, animated: true, completion: nil)
            }
        }
    }
    @IBOutlet weak var subjectLabel: LabelledTextField! {
        didSet {
            subjectLabel.trailingIconStyle = .static(icon: Asset.Media.downArrow.image)
            subjectLabel.onTextFieldTapped = { [weak self] in
                let viewController = BottomSheet.getInstance()
                viewController.modalPresentationStyle = .overCurrentContext
                viewController.modalTransitionStyle = .crossDissolve
                viewController.viewModel = BottomSheetViewModel(with: "Subjects", items: [
                    BottomSheetListCellViewModel(isSelected: false, title: "English"),
                    BottomSheetListCellViewModel(isSelected: false, title: "Science"),
                    BottomSheetListCellViewModel(isSelected: true, title: "Math"),
                ])
                viewController.onDismissWithSelection = { [weak self] selected in
                    self?.subjectLabel.inputText = selected ?? ""
                }
                self?.present(viewController, animated: true, completion: nil)
            }
        }
    }
    @IBOutlet weak var sessionRateLabel: LabelledTextField! {
        didSet {
            sessionRateLabel.trailingIconStyle = .text(string: "AED")
            sessionRateLabel.editTextKeyboardType = .decimalPad
            sessionRateLabel.onTextFieldChanged = { [weak self] text in
                self?.viewModel?.updatedRates(to: text)
            }
        }
    }
    @IBOutlet weak var totalAmountLabel: UILabel! {
        didSet {
            updateTotalAmount(to: "0")
        }
    }
    @IBOutlet weak var ctaButtonBottomConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Subjects"
        setupKeyboardNotification()
        bindViewModel()
    }

    func bindViewModel() {
        viewModel?.output = { [weak self] output in
            switch output {
            case .updateTotalAmount(let amount):
                self?.updateTotalAmount(to: amount)
            case .subjectAddedSuccessfully:
                self?.navigationController?.popViewController(animated: true)
            }
        }
    }

    func updateTotalAmount(to amount: String) {
        let trailingAttributedString = NSAttributedString(string: "/h",
                                                          attributes: [
                                                            .font: UIFont(commonFont: PoppinsFontStyle.medium, size: 12),
                                                            .foregroundColor: Asset.Colors.primary.color
                                                          ])

        let amountAttributedString = NSMutableAttributedString(string: "AED \(amount)",
                                                        attributes: [
                                                            .font: UIFont(commonFont: PoppinsFontStyle.semiBold, size: 16),
                                                            .foregroundColor: Asset.Colors.primary.color
                                                        ])
        amountAttributedString.append(trailingAttributedString)

        totalAmountLabel.attributedText = amountAttributedString
    }

    @IBAction func didTapDoneButton(_ sender: Any) {
        let subject = Subject(educationType: educationTypeLabel.inputText ?? "",
                              curriculum: curriculumLabel.inputText ?? "",
                              subject: subjectLabel.inputText ?? "",
                              rate: sessionRateLabel.inputText ?? "",
                              documents: [])
        viewModel?.didTapCTAButton(subject: subject)
    }
}

extension AddSubjectViewController {
    func setupKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

// MARK: - Keyboard target events
@objc
extension AddSubjectViewController {
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

extension AddSubjectViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .addSubject }
}
