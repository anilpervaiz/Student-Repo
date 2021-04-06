//
//  SuccessStateViewModel.swift
//  Teachers
//
//  Created by Rahim on 18/03/2021.
//

import Foundation

protocol SuccessStateViewModel {
    var title: String { get }
    var message: String { get }
    var imageName: String? { get }
    var ctaButtonTitle: String { get }

    func didTapCTAButton()
}
