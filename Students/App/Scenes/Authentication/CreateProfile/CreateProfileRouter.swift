//
//  CreateProfileRouter.swift
//  Teachers
//
//  Created by Rahim on 20/03/2021.
//

import Foundation

class CreateProfileRouter: BaseRouter {

    func navigateToRegisterSubject() {
        let viewController = RegisteredSubjectsViewController.getInstance()
        viewController.viewModel = RegisteredSubjectsViewModel()
        navigationController?.pushViewController(viewController, animated: true)
    }

    func navigateToAvilibilitySelection() {
        let viewController = AvailibilityViewController.getInstance()
        viewController.viewModel = AvailibilityViewModel()
        navigationController?.pushViewController(viewController, animated: true)
    }

    func navigateToAddPaymentMethod() {
        let viewController = PaymentMethodViewController.getInstance()
        navigationController?.pushViewController(viewController,
                                                 animated: true)
    }

    func navigateToAddPersonalInformation() {
        let viewControlle = CreateProfilePersonalInformationViewController.getInstance()
        navigationController?.pushViewController(viewControlle,
                                                 animated: true)
    }

    func navigateToAddIdCard() {
        let viewController = UploadImageViewController.getInstance()
        viewController.viewModel = UploadImageViewModel(title: "ID Card",
                                                        imageRefTitle: "No Files Uploaded!",
                                                        imageRefDescription: "National ID copy or passport copy clearly showing your picture",
                                                        ctaButtonTitle: "Add ID Card")

        navigationController?.pushViewController(viewController, animated: true)
    }

    func navigateToAddTeacherLicense() {
        let viewController = UploadImageViewController.getInstance()
        viewController.viewModel = UploadImageViewModel(title: "Teaching license",
                                                        imageRefTitle: "No Files Uploaded!",
                                                        imageRefDescription: "National ID copy or passport copy clearly showing your picture",
                                                        ctaButtonTitle: "Add File")

        navigationController?.pushViewController(viewController, animated: true)
    }

    func navigateToUploadVideo() {
        let viewController = UploadVideoViewController.getInstance()
        viewController.onDismissWithSelection = { videoData in
            // Here's your video data
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
}
