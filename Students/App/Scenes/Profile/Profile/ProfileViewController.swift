//
//  ProfileViewController.swift
//  Teachers
//
//  Created by Rahim on 24/03/2021.
//

import UIKit

class ProfileViewController: BaseViewController {

    var mockData: User = User.mockData
    var router: ProfileRouter?

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self

            collectionView.registerNibCell(with: ProfileCardCollectionViewCell.self)
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

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ProfileCards.allCases.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withType: ProfileCardCollectionViewCell.self,
                                                      for: indexPath)

        let card = ProfileCards.allCases[indexPath.row]
        cell.configure(profileCard: card)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let card = ProfileCards(rawValue: indexPath.row)
        switch card {
        case .wishlist: break
        case .subject: break
        case .session: router?.didTapSessionView()
        case .reviews: router?.didTapReviewView()
        case .address: router?.didTapAddressView()
        case .wallet: router?.didTapWalletView()
        case .paymentMethod: break
        default: break
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 8)/2
        return CGSize(width: width, height: 100)
    }
}

extension ProfileViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .profile }
}

enum ProfileCards: Int,
                   CaseIterable {
    case wishlist
    case subject
    case session
    case reviews
    case address
    case wallet
    case paymentMethod

    var title: String {
        switch self {
        case .wishlist: return "Wishlist"
        case .subject: return "My Subjects"
        case .session: return "My Sessions"
        case .reviews: return "Reviews"
        case .address: return "Address"
        case .wallet: return "My Wallet"
        case .paymentMethod: return "Payment Method"
        }
    }

    var iconName: String {
        switch self {
        case .wishlist: return "Wishlist"
        case .subject: return "subjects"
        case .session: return "mySessions"
        case .reviews: return "rating"
        case .address: return "address"
        case .wallet: return "myWallet"
        case .paymentMethod: return "billingInformation"
        }
    }
}
