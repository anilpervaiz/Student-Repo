//
//  LinkedAccountNewSessionViewController.swift
//  Students
//
//  Created by Rahim on 29/04/2021.
//

import UIKit

class LinkedAccountNewSessionViewController: BaseViewController {

    lazy var optionSelectionView: OptionSelectionView<SessionOption> = {
        let view = OptionSelectionView<SessionOption>().preparedForAutolayout()
        return view
    }()

    lazy var closeNavigationBarButton: UIBarButtonItem = {
        let view = NavigationBarItem()
        view.itemImage = Asset.Media.close.image

        let barButton = UIBarButtonItem(customView: view)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapCloseButton))
        view.addGestureRecognizer(gesture)
        return barButton
    }()

    @IBOutlet weak var optionContainerView: UIView! {
        didSet {
            optionContainerView.addSubview(optionSelectionView)
            optionSelectionView.fillSuperview()
        }
    }
    @IBOutlet weak var subjectDropdown: LabelledTextField! {
        didSet {
            subjectDropdown.trailingIconStyle = .static(icon: Asset.Media.downArrow.image)
            subjectDropdown.isEditable = false
            subjectDropdown.isTappable = true
            subjectDropdown.onTextFieldTapped = { [weak self] in
                let viewController = BottomSheet.getInstance()
                viewController.modalPresentationStyle = .overCurrentContext
                viewController.modalTransitionStyle = .crossDissolve
                viewController.viewModel = BottomSheetViewModel(with: "Select Subject", items: [
                    BottomSheetListCellViewModel(isSelected: false, title: "English"),
                    BottomSheetListCellViewModel(isSelected: false, title: "Math"),
                    BottomSheetListCellViewModel(isSelected: true, title: "History"),
                ])
                viewController.onDismissWithSelection = { [weak self] selected in
                    self?.subjectDropdown.inputText = selected ?? ""
                }
                self?.present(viewController, animated: true, completion: nil)
            }
        }
    }
    @IBOutlet weak var gradeDropdown: LabelledTextField! {
        didSet {
            gradeDropdown.trailingIconStyle = .static(icon: Asset.Media.downArrow.image)
            gradeDropdown.isEditable = false
            gradeDropdown.isTappable = true
            gradeDropdown.onTextFieldTapped = { [weak self] in
                let viewController = BottomSheet.getInstance()
                viewController.modalPresentationStyle = .overCurrentContext
                viewController.modalTransitionStyle = .crossDissolve
                viewController.viewModel = BottomSheetViewModel(with: "Select Grade", items: [
                    BottomSheetListCellViewModel(isSelected: false, title: "Grade 1"),
                    BottomSheetListCellViewModel(isSelected: false, title: "Grade 2"),
                    BottomSheetListCellViewModel(isSelected: true, title: "Grade 3"),
                ])
                viewController.onDismissWithSelection = { [weak self] selected in
                    self?.gradeDropdown.inputText = selected ?? ""
                }
                self?.present(viewController, animated: true, completion: nil)
            }
        }
    }
    
    @IBOutlet weak var curriculumDropdown: LabelledTextField! {
        didSet {
            curriculumDropdown.trailingIconStyle = .static(icon: Asset.Media.downArrow.image)
            curriculumDropdown.isEditable = false
            curriculumDropdown.isTappable = true
            curriculumDropdown.onTextFieldTapped = { [weak self] in
                let viewController = BottomSheet.getInstance()
                viewController.modalPresentationStyle = .overCurrentContext
                viewController.modalTransitionStyle = .crossDissolve

                viewController.viewModel = BottomSheetViewModel(with: "Select Curriculum", items: [
                    BottomSheetListCellViewModel(isSelected: false, title: "Math - American Curriculum"),
                    BottomSheetListCellViewModel(isSelected: false, title: "Physics - British Curriculum"),
                    BottomSheetListCellViewModel(isSelected: true, title: "History - British Curriculum"),
                ])
                viewController.onDismissWithSelection = { [weak self] selected in
                    self?.curriculumDropdown.inputText = selected ?? ""
                }
                self?.present(viewController, animated: true, completion: nil)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "New Session"
        navigationItem.leftBarButtonItem = closeNavigationBarButton
        setupSessionTypeOption()
    }

    func setupSessionTypeOption() {
        optionSelectionView.configure(with: SessionOption.allCases, title: "")
    }

    @IBAction func didTapContinueButton(_ sender: Any) {
        let controller = BrowseTeacherBuilder().makeViewController(subject: Subject.mockData.first!,
                                                                   navigationController: navigationController as! BaseNavigationController)
        navigationController?.pushViewController(controller, animated: true)
    }
}

@objc extension LinkedAccountNewSessionViewController {
    func didTapCloseButton() {
        dismiss(animated: true, completion: nil)
    }
}

extension LinkedAccountNewSessionViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .linkedAccount }
}
