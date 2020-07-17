//
//  CustomAnimatedTrayViewController.swift
//  NavigationTransition
//
//  Created by Salma Hassan on 7/17/20.
//  Copyright © 2020 salma. All rights reserved.
//

import UIKit

class CustomAnimatedTrayViewController: UIViewController {
   
   let customTransitiongDelegate = ViewControllerTransitioning()
   
   func updateTransitiong(accordingTo viewWithTag: Int) {
      let navBarView = view.subviews.filter { (subView) -> Bool in
         return subView.tag == viewWithTag
      }.first
      
      guard let navBarViewFrame = navBarView?.frame ,
         let scrollViewContainer = self.view.superview as? UIScrollView
         else { return }
      
      let restHeightSpace = self.view.frame.height - navBarViewFrame.height
      let resultFrame = CGRect(x: self.view.frame.minX,
                               y: navBarViewFrame.height + scrollViewContainer.frame.minY, 
                               width: self.view.frame.width,
                               height: restHeightSpace)
      customTransitiongDelegate.setupAnimator(_originFrame: resultFrame)
   }
   
   override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
      viewControllerToPresent.transitioningDelegate = customTransitiongDelegate
      viewControllerToPresent.modalPresentationStyle = .custom
      super.present(viewControllerToPresent, animated: true, completion: nil)
   }
}
