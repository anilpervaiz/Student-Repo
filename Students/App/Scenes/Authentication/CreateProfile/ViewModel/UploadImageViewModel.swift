//
//  UploadImageViewModel.swift
//  Teachers
//
//  Created by Rahim on 21/03/2021.
//

import Foundation

class UploadImageViewModel {
    var title: String
    var imageRefTitle: String
    var imageRefDescription: String
    var ctaButtonTitle: String

    init(title: String,
         imageRefTitle: String,
         imageRefDescription: String,
         ctaButtonTitle: String) {
        self.title = title
        self.imageRefTitle = imageRefTitle
        self.imageRefDescription = imageRefDescription
        self.ctaButtonTitle = ctaButtonTitle
    }

    func didTapCTAButton() {

    }
}
