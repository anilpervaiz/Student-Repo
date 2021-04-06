//
//  CreateProfileViewModel.swift
//  Teachers
//
//  Created by Rahim on 20/03/2021.
//

import Foundation

class CreateProfileViewModel {
    var router: CreateProfileRouter
    var sectionViewModels: [CreateProfileSectionTableCellViewModel] = []

    var numberOfRows: Int {
        sectionViewModels.count
    }

    init(router: CreateProfileRouter) {
        self.router = router
        setupData()
    }

    func setupData() {
        sectionViewModels = ProfileSection.allCases.map {
            CreateProfileSectionTableCellViewModel(section: $0)
        }
    }

    func section(at index: Int) -> CreateProfileSectionTableCellViewModel {
        return sectionViewModels[index]
    }

    func completedSection(at index: Int) {
        section(at: index).isCompleted = true
    }

    func didTapSection(at index: Int) {
        let section = sectionViewModels[index].section
        switch section {
        case .personalInformation:
            router.navigateToAddPersonalInformation()
        case .subjects:
            router.navigateToRegisterSubject()
        case .availability:
            router.navigateToAvilibilitySelection()
        case .paymentMethod:
            router.navigateToAddPaymentMethod()
        case .idCard:
            router.navigateToAddIdCard()
        case .teachingLicense:
            router.navigateToAddTeacherLicense()
        case .video:
            router.navigateToUploadVideo()
        }

        completedSection(at: index)
    }
}
