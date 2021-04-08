//
//  SettingsModel.swift
//  Teachers
//
//  Created by Rahim on 28/03/2021.
//

import Foundation

struct SettingsModel {
    enum Section: Int, CaseIterable {
        case account = 0
        case more

        var title: String {
            switch self {
            case .account: return "Account"
            case .more: return "More"
            }
        }
    }

    enum RowType {
        case link
        case `switch`
    }

    enum Row {
        case changePassword
        case language(String)
        case notification(Bool)
        case signout
        case termsAndPrivacy
        case helpCenter
        case about

        var rawValue: Int {
            switch self {
            case .changePassword: return 0
            case .language: return 1
            case .notification: return 2
            case .signout: return 4
            case .termsAndPrivacy: return 5
            case .helpCenter: return 6
            case .about: return 7
            }
        }

        var title: String {
            switch self {

            case .changePassword: return "Change Password"
            case .language: return "Language"
            case .notification: return "Notifications"
            case .signout: return "Sign Out"
            case .termsAndPrivacy: return "Terms & Privacy"
            case .helpCenter: return "Help Center"
            case .about: return "About Edukko"
            }
        }

        var subtitle: String? {
            switch self {
            case .language(let lang): return lang
            default: return nil
            }
        }

        var icon: ImageAsset? {
            switch self {
            case .changePassword: return Asset.Media.privacy
            case .language: return Asset.Media.language
            case .notification: return Asset.Media.notificationWhite
            case .signout: return Asset.Media.logout
            default: return nil
            }
        }

        var isOn: Bool {
            switch self {
            case .notification(let isOn): return isOn
            default: return false
            }
        }

        var type: RowType {
            switch self {
            case .notification: return .switch
            default: return .link
            }
        }
    }
}
