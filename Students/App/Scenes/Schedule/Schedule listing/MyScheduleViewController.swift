//
//  MyScheduleViewController.swift
//  Students
//
//  Created by Rahim on 10/04/2021.
//

import UIKit
import FSCalendar

class MyScheduleViewController: BaseViewController {
    var viewModel: MyScheduleViewModel?
    @IBOutlet weak var calendarContainerView: UIView!
    @IBOutlet weak var calendarView: FSCalendar! {
        didSet {
            calendarView.delegate = self
            calendarView.dataSource = self
            calendarView.setupStyle()
        }
    }
    @IBOutlet weak var monthLabel: UILabel! {
        didSet {
            monthLabel.text = dateFormatter.string(from: Date())
        }
    }
    @IBOutlet weak var calendarViewHeightConstraint: NSLayoutConstraint!

    lazy var chatNavigationBarButton: UIBarButtonItem = {
        let view = NavigationBarItem()
        view.itemImage = Asset.Media.chat.image

        let barButton = UIBarButtonItem(customView: view)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapChatButton))
        view.addGestureRecognizer(gesture)
        return barButton
    }()

    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter
    }()

    lazy var scopeGesture: UIPanGestureRecognizer = {
        [unowned self] in
        let panGesture = UIPanGestureRecognizer(target: calendarView, action: #selector(calendarView.handleScopeGesture(_:)))
        panGesture.delegate = self
        panGesture.minimumNumberOfTouches = 1
        panGesture.maximumNumberOfTouches = 2
        return panGesture
    }()

    lazy var notificationNavigationBarButton: UIBarButtonItem = {
        let view = NavigationBarItem()
        view.itemImage = Asset.Media.notification.image
        view.badgeCount = 3

        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapNotificationButton))
        view.addGestureRecognizer(gesture)
        return UIBarButtonItem(customView: view)
    }()

    lazy var calendarBarButtonCustomView: NavigationBarItem = {
        let view = NavigationBarItem()
        view.itemImage = Asset.Media.listIcon.image
        view.backgroundColor = Asset.Colors.lightHalfBaked.color
        view.cornerRadius = 4
        view.tintColor = Asset.Colors.halfBaked.color
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapToggleCalendarButton))
        view.addGestureRecognizer(gesture)
        return view
    }()

    lazy var calendarToggleButton: UIBarButtonItem = {
        return UIBarButtonItem(customView: calendarBarButtonCustomView)
    }()

    lazy var scheduleListingViewController: ScheduleListingViewController = {
        let viewController = ScheduleListingViewController.getInstance()
        viewController.viewModel = viewModel?.scheduleListingViewModel
        return viewController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        add(asChildViewController: scheduleListingViewController)
        setupNavigationBar()
        setupView()
    }

    func setupView() {
        view.addGestureRecognizer(scopeGesture)
        scheduleListingViewController.scheduleTableView.panGestureRecognizer.require(toFail: scopeGesture)
    }

    func setupNavigationBar() {
        setLeftAlignNavBarTitle(with: "My Schedule",
                                font: .init(commonFont: PoppinsFontStyle.semiBold, size: 20),
                                textColor: Asset.Colors.darkBlue.color)
        navigationItem.rightBarButtonItems = [notificationNavigationBarButton, chatNavigationBarButton, calendarToggleButton]
    }
    @IBAction func didTapCalendarLeftButton(_ sender: Any) {
        calendarView.setCurrentPage(calendarView.previousPage, animated: true)
    }
    @IBAction func didTapCalendarRightButton(_ sender: Any) {
        calendarView.setCurrentPage(calendarView.nextPage, animated: true)
    }

    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChild(viewController)

        // Add Child View as Subview
        let childView: UIView! = viewController.view
        view.addSubview(childView)

        // Configure Child View
        childView.preparedForAutolayout()
        childView.fillSuperviewHorizontally()
        NSLayoutConstraint.activate([
            childView.topAnchor.constraint(equalTo: calendarContainerView.bottomAnchor),
            childView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        // Notify Child View Controller
        viewController.didMove(toParent: self)
    }
}

extension MyScheduleViewController: FSCalendarDelegate, FSCalendarDataSource {
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        calendarViewHeightConstraint.constant = bounds.height + 64
        view.layoutIfNeeded()
    }

    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        if monthPosition == .next || monthPosition == .previous {
            calendar.setCurrentPage(date, animated: true)
        }
    }

    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        monthLabel.text = dateFormatter.string(from: calendar.currentPage)
    }
}

extension MyScheduleViewController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        let scheduleTableView = scheduleListingViewController.scheduleTableView
        let shouldBegin = (scheduleTableView?.contentOffset.y ?? 0) <= -(scheduleTableView?.contentInset.top ?? 0)
        if shouldBegin {
            let velocity = scopeGesture.velocity(in: view)
            switch calendarView.scope {
            case .month:
                return velocity.y < 0
            case .week:
                return velocity.y > 0
            default: return false
            }
        }
        return shouldBegin
    }
}

@objc
extension MyScheduleViewController {
    func didTapNotificationButton() {
        viewModel?.didTapNotificationButton()
    }

    func didTapChatButton() {
        viewModel?.didTapChatButton()
    }

    func didTapToggleCalendarButton() {
        switch viewModel?.calendarState {
        case .expanded: setupCollapsedCalendar()
        case .collapsed: setupExpandedCalendar()
        default: break
        }
    }

    func setupCollapsedCalendar() {
        viewModel?.calendarState = .collapsed
        calendarBarButtonCustomView.itemImage = Asset.Media.calendarIcon.image

        calendarView.setScope(.week, animated: true)
        calendarViewHeightConstraint.constant = 0
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.view.layoutIfNeeded()
            self?.calendarContainerView.alpha = 0
        }
    }

    func setupExpandedCalendar() {
        viewModel?.calendarState = .expanded
        calendarBarButtonCustomView.itemImage = Asset.Media.listIcon.image
        calendarViewHeightConstraint.constant = 144
        calendarView.setScope(.week, animated: true)
        UIView.animate(withDuration: 0.5) {[weak self] in
            self?.view.layoutIfNeeded()
            self?.calendarContainerView.alpha = 1
        }
    }
}

extension MyScheduleViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .schedule }
}
