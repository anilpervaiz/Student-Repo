//
//  RejectSessionViewController.swift
//  Teachers
//
//  Created by Rahim on 28/03/2021.
//

import UIKit

class RejectSessionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func didTapCTAButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension RejectSessionViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .sessionDetail }
}
