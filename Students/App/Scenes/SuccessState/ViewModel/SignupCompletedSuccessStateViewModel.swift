//
//  SignupCompletedSuccessStateViewModel.swift
//  Teachers
//
//  Created by Rahim on 18/03/2021.
//

import Foundation

struct SignupCompletedSuccessStateViewModel: SuccessStateViewModel {
    var router: SignupSuccessStateRouter
    var title: String = "Thank You!"
    var message: String = "Now you need to complete your profile to be able to join Edukko family."
    var imageName: String?
    var ctaButtonTitle: String = "Complete My Profile"

    func didTapCTAButton() {
        router.navigateToCreateProfile()
    }
}

struct ProfileCreatedSuccessStateViewModel: SuccessStateViewModel {
    var router: SignupSuccessStateRouter
    var title: String = "Thank You!"
    var message: String = "Our team will review your request, we will contact you shortly."
    var imageName: String?
    var ctaButtonTitle: String = "OK"

    func didTapCTAButton() {
        router.navigateToGetStarted()
    }
}
