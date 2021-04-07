//
//  SignupCompletedSuccessStateViewModel.swift
//  Teachers
//
//  Created by Rahim on 18/03/2021.
//

import Foundation

struct StudentSignupCompletedSuccessStateViewModel: SuccessStateViewModel {
    var router: SignupSuccessStateRouter
    var title: String = "Thank You!"
    var message: String = "You have successfully joined Edukko family. Searching for subjects/teachers and start an enjoyable learning journey"
    var imageName: String?
    var ctaButtonTitle: String = "Search Teachers"

    func didTapCTAButton() {
        router.navigateToGetStarted()
    }
}

struct ParentSignupCompletedSuccessStateViewModel: SuccessStateViewModel {
    var router: SignupSuccessStateRouter
    var title: String = "Thank You!"
    var message: String = "You have successfully joined Edukko family. Start add your children accounts and browse a list of our high qualified teachers."
    var imageName: String?
    var ctaButtonTitle: String = "Manage Account"

    func didTapCTAButton() {
        router.navigateToGetStarted()
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
