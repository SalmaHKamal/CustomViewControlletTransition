//
//  AnimatableDelegate.swift
//  NavigationTransition
//
//  Created by Salma Hassan on 7/17/20.
//  Copyright © 2020 salma. All rights reserved.
//

import UIKit

protocol Animatable: class {
   func customAnimationSetup(accordingTo viewWithTag: Int) -> UIViewControllerTransitioningDelegate?
}

extension Animatable where Self: UIViewController {
   func customAnimationSetup(accordingTo viewWithTag: Int) -> UIViewControllerTransitioningDelegate? {
      let customTransitiongDelegate = ViewControllerTransitioning()
      
      let navBarView = view.subviews.filter { (subView) -> Bool in
         return subView.tag == viewWithTag
      }.first
      
      guard let navBarViewFrame = navBarView?.frame else { return nil }
      let restHeightSpace = self.view.frame.height - navBarViewFrame.height
      let resultFrame = CGRect(x: self.view.frame.minX,
                               //in case of your task I think you won't need to status bar height
                               y: navBarViewFrame.height + UIApplication.shared.statusBarFrame.height,
                               width: self.view.frame.width,
                               height: restHeightSpace)
      customTransitiongDelegate.setupAnimator(_originFrame: resultFrame, _duration: 0.3)
      return customTransitiongDelegate
   }
}
