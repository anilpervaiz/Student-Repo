//
//  LoginWaitingViewController.swift
//  Teachers
//
//  Created by Rahim on 19/03/2021.
//

import UIKit

class LoginPendingProcessViewController: BaseViewController {

    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var titleLabel: HeadingLabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var errorView: ErrorView!
    @IBOutlet weak var suggestionLabel: UILabel!
    @IBOutlet weak var ctaButton: PrimaryCTAButton!

    var viewModel: LoginPendingProcessViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func didTapCTAButton(_ sender: Any) {
        viewModel?.didTapPrimaryCTAButton()
    }

    func setupView() {
        titleImageView.image = UIImage(named: viewModel?.imageName ?? "")
        titleLabel.text = viewModel?.title ?? ""
        descriptionLabel.text = viewModel?.description ?? ""
        errorView.errors = viewModel?.errors ?? []
        errorView.title = "Rejected Reasons:"
        suggestionLabel.text = viewModel?.suggestion ?? ""

        ctaButton.setTitle(viewModel?.ctaButtonTitle ?? "", for: .normal)
        errorView.isHidden = viewModel?.errors.isEmpty ?? true
        suggestionLabel.isHidden = viewModel?.suggestion.isEmpty ?? true
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        titleImageView.circular = true
    }
}

extension LoginPendingProcessViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .login }
}
