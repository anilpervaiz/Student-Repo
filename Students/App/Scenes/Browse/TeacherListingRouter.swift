//
//  TeacherListingRouter.swift
//  Students
//
//  Created by Rahim on 17/04/2021.
//

import Foundation

class TeacherListingRouter: BaseRouter {
    func navigateToTeacherProfile() {
        let viewController = TeacherProfileViewController.getInstance()
        let router = TeacherListingRouter(with: navigationController)
        let viewModel = TeacherProfileViewModel(with: router)
        viewController.viewModel = viewModel
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }

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

    func navigateToNotificationView() {
        let viewController = NotificationViewController.getInstance()
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }

    func navigateToChatView() {

        let viewController = MessagesListViewController.getInstance()
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }

    func navigateToFilterTeacherListing() {
        let viewController = FilterTeachersViewController.getInstance()
        let navigationController = BaseNavigationController(rootViewController: viewController)
        let router = TeacherListingRouter(with: navigationController)
        let viewModel = FilterTeacherViewModel(router: router)
        viewController.viewModel = viewModel
        viewController.onFilterSelected = { [weak self] in
            self?.navigateToFilteredTeacherListing()
        }
        self.navigationController?.topViewController?.present(navigationController, animated: true, completion: nil)
    }

    func navigateToFilteredTeacherListing() {
        let viewController = FilteredTeachersViewController.getInstance()
        let router = TeacherListingRouter(with: navigationController)
        viewController.viewModel = FilteredTeachersViewModel(router: router)
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }

    func navigateToBookSession() {
        let viewController = BookSessionDateTimeViewController.getInstance()
        viewController.viewModel = BookSessionDateTimeViewModel(router: BookSessionRouter(with: navigationController))

        navigationController?.pushViewController(viewController, animated: true)
    }
}
