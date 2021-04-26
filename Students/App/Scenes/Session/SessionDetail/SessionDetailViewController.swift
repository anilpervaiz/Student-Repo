//
//  SessionDetailViewController.swift
//  Teachers
//
//  Created by Rahim on 27/03/2021.
//

import UIKit

class SessionDetailViewController: BaseViewController {

    @IBOutlet weak var paymentMethodTypeLabel: UILabel!
    @IBOutlet weak var paymentMethodImageView: UIImageView!
    @IBOutlet weak var paymnetMethodView: UIView!
    @IBOutlet weak var endSessionView: UIView!
    @IBOutlet weak var startSessionView: UIView!
    @IBOutlet weak var requestedSessionButtonView: UIView!
    @IBOutlet weak var teacherRatingLabel: UILabel!
    @IBOutlet weak var teacherName: UILabel!
    @IBOutlet weak var teacherImageView: UIImageView!
    @IBOutlet weak var sessionMediumTitleLabel: UILabel!
    @IBOutlet weak var sessionMediumImageView: UIImageView!
    @IBOutlet weak var sessionTimeLabel: UILabel!
    @IBOutlet weak var sessionDateLabel: UILabel!
    @IBOutlet weak var subjectDescriptionLabel: UILabel!
    @IBOutlet weak var subjectName: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    var viewModel: SessionDetailViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        bindViewModel() 
        setupData()
    }

    func bindViewModel() {
        viewModel?.output = { [weak self] output in
            switch output {
            case .reloadData: self?.setupData()
            }
        }
    }

    func setupData() {
        teacherRatingLabel.text = "\(viewModel?.teacher.rating ?? 0)"
        teacherName.text = viewModel?.teacher.name
        teacherImageView.image = UIImage(named: viewModel?.teacher.profileImage ?? "")
        sessionMediumImageView.image = viewModel?.session.medium.icon.image
        sessionMediumImageView.tintColor = viewModel?.session.medium.themeColor.color
        sessionMediumTitleLabel.text = viewModel?.session.medium.title
        sessionMediumTitleLabel.textColor = viewModel?.session.medium.themeColor.color
        sessionTimeLabel.text = "Monday, 4 Feb"
        sessionDateLabel.text = "2:30 PM - 01:30 PM (1 hour)"
        subjectDescriptionLabel.text = "\(viewModel?.subject.curriculum ?? "") - \(viewModel?.subject.educationType ?? "")"
        subjectName.text = viewModel?.subject.subject
        titleLabel.text = viewModel?.sessionState.title

        if viewModel?.sessionState == .requested {
            requestedSessionButtonView.isHidden = false
            startSessionView.isHidden = true
            endSessionView.isHidden = true
        } else if viewModel?.sessionState == .accepted {
            requestedSessionButtonView.isHidden = true
            startSessionView.isHidden = false
            endSessionView.isHidden = true
        } else if viewModel?.sessionState == .started {
            requestedSessionButtonView.isHidden = true
            startSessionView.isHidden = true
            endSessionView.isHidden = false
        }

        if AppManager.userType == .parent {
            paymnetMethodView.isHidden = false
            paymentMethodImageView.image = Asset.Media.applePay.image
            paymentMethodTypeLabel.text = "Apple Pay"
        } else {
            paymnetMethodView.isHidden = true
        }
    }

    @IBAction func chatWithStudentButton(_ sender: Any) {
        viewModel?.didTapChatButton()
    }
    
    @IBAction func didTapAcceptButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func didTapRejectButton(_ sender: Any) {
        viewModel?.didTapRejectButton()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        teacherImageView.circular = true
    }
    @IBAction func didTapStartSessionButton(_ sender: Any) {
        viewModel?.didTapStartSessionButton()
    }

    @IBAction func didTapEndSessionButton(_ sender: Any) {
        viewModel?.didTapEndSessionButton()
    }
}

extension SessionDetailViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .sessionDetail }
}
