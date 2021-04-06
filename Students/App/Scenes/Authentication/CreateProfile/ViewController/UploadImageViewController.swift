//
//  UploadItemViewController.swift
//  Teachers
//
//  Created by Rahim on 21/03/2021.
//

import UIKit

class UploadImageViewController: BaseViewController {

    var viewModel: UploadImageViewModel?
    @IBOutlet weak var emptyViewIllustrationImageView: UIImageView!
    @IBOutlet weak var uploadedItemImageView: UIImageView! {
        didSet {
            uploadedItemImageView.contentMode = .scaleAspectFill
            uploadedItemImageView.clipsToBounds = true
            uploadedItemImageView.cornerRadius = 4
        }
    }
    @IBOutlet weak var emptyStateView: UIView!
    @IBOutlet weak var normalStateView: UIView!
    @IBOutlet weak var titleLabel: HeadingLabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ctaButton: SecondaryCTAButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    func setupView() {
        normalStateView.isHidden  = true
        emptyStateView.isHidden = false

        title = viewModel?.title ?? ""
        titleLabel.text = viewModel?.imageRefTitle ?? ""
        descriptionLabel.text = viewModel?.imageRefDescription ?? ""
        ctaButton.setTitle(viewModel?.ctaButtonTitle ?? "",
                           for: .normal)
    }

    @IBAction func didTapCTAButton(_ sender: Any) {
        let bottomSheet = ImagePickerOptionSheetViewController.getInstance()
        bottomSheet.onDismissWithSelection = { [weak self] data in
            guard let data = data else { return }
            self?.uploadedItemImageView.image = UIImage(data: data)
            self?.emptyStateView.isHidden = true
            self?.normalStateView.isHidden = false
        }
        bottomSheet.modalPresentationStyle = .overCurrentContext
        bottomSheet.modalTransitionStyle = .crossDissolve
        present(bottomSheet,
                animated: true,
                completion: nil)
    }

    @IBAction func didTapDeleteButton(_ sender: Any) {
        uploadedItemImageView.image = nil
        emptyStateView.isHidden = false
        normalStateView.isHidden = true
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        emptyViewIllustrationImageView.circular = true
    }

    @IBAction func didTapDoneButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension UploadImageViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .createProfile }
}
