//
//  UIWindow+RootView.swift
//  Teachers
//
//  Created by Rahim on 20/03/2021.
//

import UIKit

extension UIWindow {
    func switchRoot(to newRootVc: UIViewController,
                    isAnimated animation: Bool = true,
                    completion:(() -> Void)? = nil) {
        if animation {
            UIView.transition(with: self,
                              duration: 0.3,
                              options: .transitionCrossDissolve,
                              animations: { [weak self] in
                                /// because of using UIView.Transition when updating window rootViewController,
                                /// It performs its own animation. Which when combined with UIView.
                                /// transition causes some weird animations. Therefore its better to disable
                                /// view animation and restore once rootViewController is set.
                                let oldState = UIView.areAnimationsEnabled
                                UIView.setAnimationsEnabled(false)
                                self?.rootViewController = newRootVc
                                UIView.setAnimationsEnabled(oldState)
                              }, completion: { _ in
                                completion?()
                              })
        } else {
            rootViewController = newRootVc
        }
    }

}
