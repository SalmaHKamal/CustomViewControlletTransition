//
//  NavigationDelegate.swift
//  NavigationTransition
//
//  Created by Salma Hassan on 7/17/20.
//  Copyright © 2020 salma. All rights reserved.
//

import UIKit

class CustomNavigationAnimation: NSObject, UINavigationControllerDelegate {
   func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
      
      let navigationBarAnimation = CATransition()
      navigationBarAnimation.duration = 100
      navigationController.navigationBar.layer.add(navigationBarAnimation, forKey: nil)
      
   }

   func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
      navigationController.navigationBar.layer.removeAllAnimations()
   }
}
