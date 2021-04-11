//
//  FilterTeacherRouter.swift
//  Students
//
//  Created by Rahim on 11/04/2021.
//

import Foundation

class FilterTeacherRouter: BaseRouter {
    func presentRadioButtonBottomSheet(title: String, items: [BottomSheetListCellViewModel], onSelect: ((String?) -> ())?) {
        let viewController = BottomSheet.getInstance()
        viewController.modalPresentationStyle = .overCurrentContext
        viewController.modalTransitionStyle = .crossDissolve
        viewController.viewModel = BottomSheetViewModel(with: "Select Grade", items: [
            BottomSheetListCellViewModel(isSelected: false, title: "Grade 1"),
            BottomSheetListCellViewModel(isSelected: false, title: "Grade 2"),
            BottomSheetListCellViewModel(isSelected: true, title: "Grade 3"),
        ])
        viewController.onDismissWithSelection = { selected in
            onSelect?(selected)
        }
        let topViewController = navigationController?.topViewController
        topViewController?.present(viewController, animated: true, completion: nil)
    }
}
