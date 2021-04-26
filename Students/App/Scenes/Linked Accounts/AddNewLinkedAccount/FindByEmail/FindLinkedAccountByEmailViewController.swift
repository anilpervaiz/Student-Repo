//
//  FindLinkedAccountByEmailViewController.swift
//  Students
//
//  Created by Rahim on 25/04/2021.
//

import UIKit

class FindLinkedAccountByEmailViewController: BaseViewController {

    var router: LinkedAccountRouter!
    @IBOutlet weak var emailLabelledTextField: LabelledTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Find by Email"
    }

    @IBAction func didTapFindButton(_ sender: Any) {
        router.presentSearchedAccountsBottomSheet()
    }
}

extension FindLinkedAccountByEmailViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .linkedAccount }
}
