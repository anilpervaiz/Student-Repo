//
//  LoginPendingProcessViewModel.swift
//  Teachers
//
//  Created by Rahim on 19/03/2021.
//

import Foundation

protocol LoginPendingProcessViewModel {
    var imageName: String { get }
    var title: String { get }
    var description: String { get }

    var errors: [String] { get }
    var suggestion: String { get }

    var ctaButtonTitle: String { get }

    func didTapPrimaryCTAButton()
}
