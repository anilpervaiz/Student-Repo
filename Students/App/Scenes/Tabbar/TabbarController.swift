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
            RequestListingSceneBuilder().makeViewController(),
            ScheduleListingSceneBuilder().makeViewController(),
            StudentListingSceneBuilder().makeViewController(),
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
    case request
    case schedule
    case student
    case profile

    var normalStyleImageName: ImageAsset {
        switch self {
        case .dashboard: return Asset.Media.tabbarDashboardNormal
        case .request: return Asset.Media.tabbarRequestNormal
        case .schedule: return Asset.Media.tabbarScheduleNormal
        case .student: return Asset.Media.tabbarStudentNormal
        case .profile: return Asset.Media.tabbarProfileNormal
        }
    }

    var selectedStyleImageName: ImageAsset {
        switch self {
        case .dashboard: return Asset.Media.tabbarDashboardSelected
        case .request: return Asset.Media.tabbarRequestsSelected
        case .schedule: return Asset.Media.tabbarScheduleSelected
        case .student: return Asset.Media.tabbarStudentSelected
        case .profile: return Asset.Media.tabbarProfileSelected
        }
    }

    var title: String {
        switch self {
        case .dashboard: return "Dashboard"
        case .request: return "Requests"
        case .schedule: return "Schedule"
        case .student: return "Students"
        case .profile: return "Profile"
        }
    }
}
