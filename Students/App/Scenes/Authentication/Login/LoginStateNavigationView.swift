//
//  LoginStateNavigationView.swift
//  Teachers
//
//  Created by Rahim on 24/03/2021.
//

import UIKit

// This class is just for demo purpose, should be removed once BE is integrated.
class LoginStateNavigationView: UIViewController {

    var router: LoginRouter?
    lazy var verificationRejectedButton: UIButton = {
        let button = UIButton().preparedForAutolayout()
        button.heightAnchor.constraint(equalToConstant: 56).isActive = true
        button.setTitle("Verification Rejected", for: .normal)
        button.backgroundColor = Asset.Colors.primary.color
        button.addTarget(self, action: #selector(didTapVerificationFailed), for: .touchUpInside)
        return button
    }()

    lazy var verificationPendingButton: UIButton = {
        let button = UIButton().preparedForAutolayout()
        button.heightAnchor.constraint(equalToConstant: 56).isActive = true
        button.setTitle("Verification Pending", for: .normal)
        button.backgroundColor = Asset.Colors.primary.color
        button.addTarget(self, action: #selector(didTapVerificationPending), for: .touchUpInside)
        return button
    }()

    lazy var loginSuccessfulButton: UIButton = {
        let button = UIButton().preparedForAutolayout()
        button.heightAnchor.constraint(equalToConstant: 56).isActive = true
        button.setTitle("Login successful", for: .normal)
        button.backgroundColor = Asset.Colors.primary.color
        button.addTarget(self, action: #selector(didTapLoginSuccessful), for: .touchUpInside)
        return button
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {

        view.backgroundColor = Asset.Colors.pureWhite.color
        view.addSubview(verificationRejectedButton)
        view.addSubview(verificationPendingButton)
        view.addSubview(loginSuccessfulButton)

        verificationRejectedButton.fillSuperviewHorizontally()
        verificationPendingButton.fillSuperviewHorizontally()
        loginSuccessfulButton.fillSuperviewHorizontally()

        NSLayoutConstraint.activate([
            verificationRejectedButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                                            constant: AppDimension.margin.extraLarge),
            verificationPendingButton.topAnchor.constraint(equalTo: verificationRejectedButton.bottomAnchor,
                                                           constant: AppDimension.margin.medium),
            loginSuccessfulButton.topAnchor.constraint(equalTo: verificationPendingButton.bottomAnchor,
                                                       constant: AppDimension.margin.medium)
        ])
    }
}

@objc extension LoginStateNavigationView {
    func didTapVerificationFailed() {
        router?.presentProfileRejectedView()
    }

    func didTapVerificationPending() {
        router?.presentProfileVerificationPendingView()
    }

    func didTapLoginSuccessful() {
        router?.navigateToHomeScreen()
    }
}
