//
//  DashboardViewController.swift
//  Teachers
//
//  Created by Rahim on 24/03/2021.
//

import UIKit

class DashboardViewController: BaseViewController {

    var viewModel: DashboardViewModel?

    @IBOutlet weak var reviewCollectionViewHeader: CollectionViewTitleHeader! {
        didSet {
            reviewCollectionViewHeader.titleLabel.text = "Latest Reviews"
        }
    }
    @IBOutlet weak var sessionCollectionViewHeader: CollectionViewTitleHeader! {
        didSet {
            sessionCollectionViewHeader.titleLabel.text = "Today’s Sessions"
        }
    }
    @IBOutlet weak var reviewsCollectionView: UICollectionView! {
        didSet {
            reviewsCollectionView.delegate = self
            reviewsCollectionView.dataSource = self
            reviewsCollectionView.registerNibCell(with: DashboardReviewCollectionViewCell.self)
        }
    }
    @IBOutlet weak var sessionCollectionView: UICollectionView! {
        didSet {

            sessionCollectionView.delegate = self
            sessionCollectionView.dataSource = self
            sessionCollectionView.registerNibCell(with: DashboardSessionCollectionViewCell.self)
        }
    }
    @IBOutlet weak var totalSessionsCard: DashboardCard! {
        didSet {
            totalSessionsCard.viewModel = DashboardCardViewModel(imageAsset: Asset.Media.sessionsCardIcon,
                                                                 title: "Total Sessions",
                                                                 description: "24")
        }
    }
    @IBOutlet weak var learningHourCard: DashboardCard! {
        didSet {
            learningHourCard.viewModel = DashboardCardViewModel(imageAsset: Asset.Media.tutoredHoursCardIcon,
                                                                 title: "Learning Hours",
                                                                 description: "102")
        }
    }
    lazy var chatNavigationBarButton: UIBarButtonItem = {
        let view = NavigationBarItem()
        view.itemImage = Asset.Media.chat.image

        let barButton = UIBarButtonItem(customView: view)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapChatButton))
        view.addGestureRecognizer(gesture)
        return barButton
    }()

    lazy var notificationNavigationBarButton: UIBarButtonItem = {
        let view = NavigationBarItem()
        view.itemImage = Asset.Media.notification.image
        view.badgeCount = 3

        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapNotificationButton))
        view.addGestureRecognizer(gesture)
        return UIBarButtonItem(customView: view)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        navigationController?.navigationBar.barStyle = .default
    }

    func setupNavigationBar() {
        setLeftAlignNavBarTitle(with: "Welcome Back, Ahmed!")

        navigationItem.rightBarButtonItems = [notificationNavigationBarButton, chatNavigationBarButton]
    }
}

@objc
extension DashboardViewController {
    func didTapNotificationButton() {
        viewModel?.didTapNotificationButton()
    }

    func didTapChatButton() {
        viewModel?.didTapChatButton()
    }
}

extension DashboardViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == reviewsCollectionView {
            return Review.mockData.count
        } else {
            return Session.mockData.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == reviewsCollectionView {
            let cell = collectionView.dequeueReusableCell(withType: DashboardReviewCollectionViewCell.self, for: indexPath)
            cell.configure(with: Review.mockData[indexPath.row])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withType: DashboardSessionCollectionViewCell.self, for: indexPath)
            cell.configure(session: Session.mockData[indexPath.row])
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - 32
        if collectionView == reviewsCollectionView {
            return CGSize(width: width, height: 160)
        } else {
            return CGSize(width: width, height: 124)
        }
    }
}

extension DashboardViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .dashboard }
}
