//
//  LoginProfileRejectViewModel.swift
//  Teachers
//
//  Created by Rahim on 19/03/2021.
//

import Foundation

struct LoginProfileRejectViewModel: LoginPendingProcessViewModel {
    var imageName: String = Asset.Media.getStartedIllustration.name
    var title: String = "We Are Sorry!"

    var description: String = "Your request to join Edukko team has been rejected."

    var errors: [String] = ["The ID Card Image not clear enough.",
                            "Tempus pulvinar mauris consectetur.",
                            "Tempus pulvinar mauris consectetur."]

    var suggestion: String = "Update your profile and request to joing Edukko team again."
    var ctaButtonTitle: String = "Update my profile"

    func didTapPrimaryCTAButton() {

    }
}
