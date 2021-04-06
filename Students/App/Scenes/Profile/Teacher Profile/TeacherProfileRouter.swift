//
//  TeacherProfileRouter.swift
//  Teachers
//
//  Created by Rahim on 30/03/2021.
//

import Foundation

class TeacherProfileRouter: BaseRouter {

    func navigateToEditPersonalInformation() {
        let viewController = CreateProfilePersonalInformationViewController.getInstance()
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }

    func didTapBillingInformationView() {
        let viewController = BillingInformationViewController.getInstance()
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }

    func didTapDocumentView() {
        let viewController = DocumentLibraryViewController.getInstance()
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }

    func didTapSettings() {
        let viewController = SettingsViewController.getInstance()
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }

    func didTapWalletView() {
        let viewController = MyWalletViewController.getInstance()
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }

    func didTapReviewView() {
        let viewController = ReviewsViewController.getInstance()
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }  

    func didTapSessionView() {
        let viewController = ScheduleListingSceneBuilder().makeProfileSessionsViewController(with: navigationController)
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }

    func didTapAvailabilityView() {
        let viewController = AvailibilityViewController.getInstance()
        viewController.viewModel = AvailibilityViewModel()
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }

    func didTapSubjectsView() {
        let viewController = RegisteredSubjectsViewController.getInstance()
        let viewModel = RegisteredSubjectsViewModel()
        viewModel.subjects = [Subject.mockData.first!]
        viewController.viewModel = viewModel
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }
}
