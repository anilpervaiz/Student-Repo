//
//  SuccessStateViewController.swift
//  Teachers
//
//  Created by Rahim on 18/03/2021.
//

import UIKit

class SuccessStateViewController: BaseViewController {

    @IBOutlet weak var ctaButton: PrimaryCTAButton! {
        didSet {
            ctaButton.setTitle(viewModel?.ctaButtonTitle ?? "", for: .normal)
        }
    }
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.text = viewModel?.message
        }
    }
    @IBOutlet weak var titleImageView: UIImageView! {
        didSet {
            titleImageView.image = UIImage(named: viewModel?.imageName ?? "")
        }
    }
    @IBOutlet weak var titleLabel: HeadingLabel! {
        didSet {
            titleLabel.text = viewModel?.title
        }
    }
    var viewModel: SuccessStateViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapPrimaryCTAButton(_ sender: Any) {
        viewModel?.didTapCTAButton()
    }
}

extension SuccessStateViewController {
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        titleImageView.circular = true
    }
}

extension SuccessStateViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .successState }
}
