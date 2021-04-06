//
//  LoginAccountWaitingReviewViewModel.swift
//  Teachers
//
//  Created by Rahim on 19/03/2021.
//

import Foundation

struct LoginAccountWaitingReviewViewModel: LoginPendingProcessViewModel {
    var imageName: String = Asset.Media.getStartedIllustration.name
    var title: String = "Hello Ahmed!"
    var description: String = "We are currently reviewing your profile, when we are done reviewing it we will contact you."

    var errors: [String] = []
    var suggestion: String = ""
    var ctaButtonTitle: String = "I’m Waiting.."

    func didTapPrimaryCTAButton() {
        
    }
}
