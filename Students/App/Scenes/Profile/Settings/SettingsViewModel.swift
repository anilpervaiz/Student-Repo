//
//  SettingsViewModel.swift
//  Teachers
//
//  Created by Rahim on 28/03/2021.
//

import Foundation

class SettingsViewModel {
    var data: [SettingsModel.Section: [SettingsModel.Row]] = [:]
    var section = SettingsModel.Section.allCases

    init() {
        data[.account] = [.changePassword, .language("English"), .notification(true), .goOffline(false), .signout]
        data[.more] = [.termsAndPrivacy, .helpCenter, .about]
    }

    func numberOfRows(in sectionIndex: Int) -> Int {
        data[section[sectionIndex]]?.count ?? 0
    }

    func row(at indexPath: IndexPath) -> SettingsModel.Row? {
        data[section[indexPath.section]]?[indexPath.row]
    }

    func header(for sectionIndex: Int) -> String {
        section[sectionIndex].title
    }

    func didSelectRow(at indexPath: IndexPath) {
        
    }
}
