//
//  SessionDetailViewController.swift
//  Teachers
//
//  Created by Rahim on 27/03/2021.
//

import UIKit

class SessionDetailViewController: BaseViewController {

    @IBOutlet weak var endSessionView: UIView!
    @IBOutlet weak var startSessionView: UIView!
    @IBOutlet weak var requestedSessionButtonView: UIView!
    @IBOutlet weak var studentRatingLabel: UILabel!
    @IBOutlet weak var studentName: UILabel!
    @IBOutlet weak var parentImageView: UIImageView!
    @IBOutlet weak var studentImageView: UIImageView!
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
        studentRatingLabel.text = "\(viewModel?.student.rating ?? 0)"
        studentName.text = viewModel?.student.name
        parentImageView.image = UIImage(named: viewModel?.student.parent.profileImage ?? "")
        studentImageView.image = UIImage(named: viewModel?.student.profileImage ?? "")
        sessionMediumImageView.image = viewModel?.session.medium.icon.image
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

        studentImageView.circular = true
        parentImageView.circular = true
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
