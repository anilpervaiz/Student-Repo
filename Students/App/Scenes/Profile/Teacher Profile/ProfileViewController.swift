//
//  ProfileViewController.swift
//  Teachers
//
//  Created by Rahim on 24/03/2021.
//

import UIKit

class ProfileViewController: BaseViewController {

    var mockData: User = User.mockData
    var router: TeacherProfileRouter?

    @IBOutlet weak var billingInformationView: UIView! {
        didSet {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapBillingInformationView))
            billingInformationView.addGestureRecognizer(gesture)
        }
    }
    @IBOutlet weak var documentLibraryView: UIView! {
        didSet {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapDocumentView))
            documentLibraryView.addGestureRecognizer(gesture)
        }
    }
    @IBOutlet weak var walletView: UIView! {
        didSet {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapWalletView))
            walletView.addGestureRecognizer(gesture)
        }
    }
    @IBOutlet weak var reviewsView: UIView! {
        didSet {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapReviewView))
            reviewsView.addGestureRecognizer(gesture)
        }
    }
    @IBOutlet weak var mySessionsView: UIView! {
        didSet {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapSessionView))
            mySessionsView.addGestureRecognizer(gesture)
        }
    }
    @IBOutlet weak var availabilityView: UIView! {
        didSet {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapAvailabilityView))
            availabilityView.addGestureRecognizer(gesture)
        }
    }
    @IBOutlet weak var subjectsView: UIView! {
        didSet {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapSubjectsView))
            subjectsView.addGestureRecognizer(gesture)
        }
    }
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupData()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
        navigationController?.navigationBar.barStyle = .blackTranslucent
    }

    func setupData() {
        profileImageView.image = UIImage(named: mockData.profileImage)
        nameLabel.text = mockData.name
        ratingLabel.text = "\(mockData.rating)"
    }

    override func viewDidLayoutSubviews() {
        profileImageView.circular = true
        editButton.circular = true
        settingsButton.circular = true
    }

    @IBAction func didTapEditButton(_ sender: Any) {
        router?.navigateToEditPersonalInformation()
    }

    @IBAction func didTapSettingsButton(_ sender: Any) {
        router?.didTapSettings()
    }
}

@objc
extension ProfileViewController {
    func didTapBillingInformationView() {
        router?.didTapBillingInformationView()
    }

    func didTapDocumentView() {
        router?.didTapDocumentView()
    }

    func didTapWalletView() {
        router?.didTapWalletView()
    }

    func didTapReviewView() {
        router?.didTapReviewView()
    }

    func didTapSessionView() {
        router?.didTapSessionView()
    }

    func didTapAvailabilityView() {
        router?.didTapAvailabilityView()
    }

    func didTapSubjectsView() {
        router?.didTapSubjectsView()
    }
}

extension ProfileViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .profile }
}
