//
//  OnboardingPage.swift
//  Teachers
//
//  Created by Rahim on 18/03/2021.
//

import Foundation

enum OnboardingPage: CaseIterable {
    case page1
    case page2
    case page3

    var title: String {
        switch self {
        case .page1: return "Build your student network"
        case .page2: return "Online Learning Platform"
        case .page3: return "One hub for all your needs"
        }
    }

    var description: String {
        switch self {
        case .page1: return "Choose from 100,000 online certified teachers."
        case .page2: return "Choose from 100,000 online certified teachers."
        case .page3: return "Choose from 100,000 online certified teachers."
        }
    }

    var imageName: String {
        switch self {
        case .page1: return Asset.Media.onboardingPage1.name
        case .page2: return Asset.Media.onboardingPage2.name
        case .page3: return Asset.Media.onboardingPage3.name
        }
    }
}
