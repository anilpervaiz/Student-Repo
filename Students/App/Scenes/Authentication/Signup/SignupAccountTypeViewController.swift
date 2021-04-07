//
//  SignupAccountTypeViewController.swift
//  Students
//
//  Created by Rahim on 05/04/2021.
//

import UIKit

class SignupAccountTypeViewController: BaseViewController {

    @IBAction func continueWithStudentFlow(_ sender: Any) {
        let viewController = SignupPersonalInformationViewController.getInstance()
        viewController.userType = .student
        navigationController?.pushViewController(viewController, animated: true)
    }

    @IBAction func continueWithParentFlow(_ sender: Any) {
        let viewController = SignupPersonalInformationViewController.getInstance()
        viewController.userType = .parent
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension SignupAccountTypeViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .signup }
}
