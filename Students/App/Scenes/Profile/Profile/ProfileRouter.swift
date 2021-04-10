//
//  ProfileRouter.swift
//  Teachers
//
//  Created by Rahim on 30/03/2021.
//

import Foundation

class ProfileRouter: BaseRouter {

    func navigateToEditPersonalInformation() {
        let viewController = CreateProfilePersonalInformationViewController.getInstance()
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
        let viewController = MyTransactionsViewController.getInstance()
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }

    func didTapReviewView() {
        let viewController = ReviewsViewController.getInstance()
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }  

    func didTapSessionView() {
        let viewController = MyFilteredScheduleViewController.getInstance()
        viewController.viewModel = MyFilteredScheduleViewModel(router: MyScheduleRouter(with: navigationController))
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
        let viewController = UpdateSubjectsViewController.getInstance()
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }

    func didTapAddressView() {
        let viewController = AddressListingViewController.getInstance()
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }

    func didTapPaymentMethod() {
        let viewController = PaymentMethodViewController.getInstance()
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }

    func didTapWishList() {
        let viewController = CategorizedWishlistViewController.getInstance()
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }
}
