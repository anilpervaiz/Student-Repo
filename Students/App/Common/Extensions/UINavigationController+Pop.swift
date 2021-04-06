//
//  UINavigationController+Pop.swift
//  Teachers
//
//  Created by Rahim on 19/03/2021.
//

import UIKit

extension UINavigationController {

   func backToViewController(vc: Any) {
      // iterate to find the type of vc
      for element in viewControllers as Array {
        if "\(type(of: element)).Type" == "\(type(of: vc))" {
            self.popToViewController(element, animated: true)
            break
         }
      }
   }

}
