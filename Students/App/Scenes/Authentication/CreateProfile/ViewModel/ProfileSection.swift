//
//  ProfileSection.swift
//  Teachers
//
//  Created by Rahim on 20/03/2021.
//

import Foundation

enum ProfileSection: String,
                     LocalizableCaseIterable {
    case personalInformation
    case subjects
    case availability
    case paymentMethod
    case idCard
    case teachingLicense
    case video

    var title: String {
        switch self {
        case .personalInformation: return "Personal Information"
        case .subjects: return "Subjects"
        case .availability: return "Availability"
        case .paymentMethod: return "Payment Method"
        case .idCard: return "ID Card"
        case .teachingLicense: return "Teaching license"
        case .video: return "1-min Video"
        }
    }

    var optional: Bool {
        switch self {
        case .teachingLicense: return true
        default: return false
        }
    }
}
