//
//  SessionEndNoteViewController.swift
//  Teachers
//
//  Created by Rahim on 28/03/2021.
//

import UIKit

class SessionEndNoteViewController: BaseViewController {

    private lazy var skipButton: UIBarButtonItem = {
        let skipButton = UIBarButtonItem(title: "Skip", style: .plain, target: self, action: #selector(didTapSkipButton))
        skipButton.tintColor = Asset.Colors.gray.color

        return skipButton
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
         navigationItem.rightBarButtonItem = skipButton
    }

    @IBAction func didTapCTAButton(_ sender: Any) {
        let viewController = RateAndReviewBuilder().makeViewController()
        present(viewController, animated: true, completion: nil)
    }
}

@objc
extension SessionEndNoteViewController{
    func didTapSkipButton() {
        let viewController = RateAndReviewBuilder().makeViewController()
        present(viewController, animated: true, completion: nil)
    }
}

extension SessionEndNoteViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .schedule }
}
