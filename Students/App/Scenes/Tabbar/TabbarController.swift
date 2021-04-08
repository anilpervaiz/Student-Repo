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
        viewControllers = [
            DashboardSceneBuilder().makeViewController(),
            BrowseSessionBuilder().makeViewController(),
            ScheduleListingSceneBuilder().makeViewController(),
            ProfileSceneBuilder().makeViewController()
        ]

        for tab in Tabs.allCases {
            tabBar.items?[tab.rawValue].image = tab.normalStyleImageName.image
            tabBar.items?[tab.rawValue].selectedImage = tab.selectedStyleImageName.image
            tabBar.items?[tab.rawValue].title = tab.title
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
    case profile

    var normalStyleImageName: ImageAsset {
        switch self {
        case .dashboard: return Asset.Media.tabbarDashboardNormal
        case .browse: return Asset.Media.tabbarBrowseNormal
        case .schedule: return Asset.Media.tabbarScheduleNormal
        case .profile: return Asset.Media.tabbarProfileNormal
        }
    }

    var selectedStyleImageName: ImageAsset {
        switch self {
        case .dashboard: return Asset.Media.tabbarDashboardSelected
        case .browse: return Asset.Media.tabbarBrowseSelected
        case .schedule: return Asset.Media.tabbarScheduleSelected
        case .profile: return Asset.Media.tabbarProfileSelected
        }
    }

    var title: String {
        switch self {
        case .dashboard: return "Dashboard"
        case .browse: return "Browse"
        case .schedule: return "Schedule"
        case .profile: return "Profile"
        }
    }
}
