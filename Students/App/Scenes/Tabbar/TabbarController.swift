//
//  TabbarController.swift
//  Teachers
//
//  Created by Rahim on 23/03/2021.
//

import UIKit

class TabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbarAppearance()
        setupTabs()
    }

    func setupTabbarAppearance() {
        UITabBarItem.appearance().setTitleTextAttributes([
            .font: UIFont.init(commonFont: PoppinsFontStyle.medium, size: 10),
            .foregroundColor: Asset.Colors.lightGray.color
        ],
        for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([
            .font: UIFont.init(commonFont: PoppinsFontStyle.bold, size: 10),
            .foregroundColor: Asset.Colors.primary.color
        ],
        for: .selected)
    }

    func setupTabs() {
        tabBar.tintColor = Asset.Colors.primary.color
        viewControllers = setupTabControllers()

        var allTabs = Tabs.allCases
        if AppManager.userType == .student {
            allTabs.removeAll { $0 == .request }
            allTabs.removeAll { $0 == .accounts }
        } else {
            allTabs.removeAll { $0 == .schedule }
        }
        var count = 0
        for tab in allTabs {

            tabBar.items?[count].image = tab.normalStyleImageName.image
            tabBar.items?[count].selectedImage = tab.selectedStyleImageName.image
            tabBar.items?[count].title = tab.title
            count += 1
        }
    }

    func setupTabControllers() -> [UIViewController] {
        switch AppManager.userType {
        case .parent:
            return [
                DashboardSceneBuilder().makeViewController(),
                BrowseTeacherBuilder().makeViewController(),
                RequestListingSceneBuilder().makeViewController(),
                LinkedAccountListBuilder().makeViewController(),
                ProfileSceneBuilder().makeViewController()
            ]
        case .student:
            return [
                DashboardSceneBuilder().makeViewController(),
                BrowseTeacherBuilder().makeViewController(),
                MyScheduleBuilder().makeViewController(),
                ProfileSceneBuilder().makeViewController()
            ]
        }
    }
}

extension TabbarController: Initializable {
    static var storyboardName: UIStoryboard.Name {
        .tabbar
    }
}

enum Tabs: Int, CaseIterable {
    case dashboard
    case browse
    case schedule
    case request
    case accounts
    case profile

    var normalStyleImageName: ImageAsset {
        switch self {
        case .dashboard: return Asset.Media.tabbarDashboardNormal
        case .browse: return Asset.Media.tabbarBrowseNormal
        case .schedule: return Asset.Media.tabbarScheduleNormal
        case .request: return Asset.Media.tabbarRequestNormal
        case .profile: return Asset.Media.tabbarProfileNormal
        case .accounts: return Asset.Media.tabbarLinkedAccountNormal
        }
    }

    var selectedStyleImageName: ImageAsset {
        switch self {
        case .dashboard: return Asset.Media.tabbarDashboardSelected
        case .browse: return Asset.Media.tabbarBrowseSelected
        case .request: return Asset.Media.tabbarRequestsSelected
        case .schedule: return Asset.Media.tabbarScheduleSelected
        case .profile: return Asset.Media.tabbarProfileSelected
        case .accounts: return Asset.Media.tabbarLinkedAccountSelected
        }
    }

    var title: String {
        switch self {
        case .dashboard: return "Dashboard"
        case .request: return "Requests"
        case .browse: return "Browse"
        case .schedule: return "Schedule"
        case .profile: return "Profile"
        case .accounts: return "Accounts"
        }
    }
}
