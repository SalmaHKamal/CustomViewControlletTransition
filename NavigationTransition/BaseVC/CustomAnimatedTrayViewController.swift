//
//  CustomAnimatedTrayViewController.swift
//  NavigationTransition
//
//  Created by Salma Hassan on 7/17/20.
//  Copyright © 2020 salma. All rights reserved.
//

import UIKit

//protocol Animatable {
//   func passCurrentViewHeight
//}

class CustomAnimatedTrayViewController: UIViewController {
   
   var customTransitiongDelegate : ViewControllerTransitioning? //ViewControllerTransitioning()
   
   override func viewDidLoad() {
      super.viewDidLoad()
//      let navBarView = view.subviews.filter { (subView) -> Bool in
//         return subView.tag == -1000
//      }.first
//
//      guard let containerView = self.view.superview else { return }
//
//      var navBarViewFrame = CGRect.zero
//
//      if navBarView?.frame != nil {
//         navBarViewFrame = (navBarView?.frame)!
//      }
////
////      guard let navBarViewFrame = navBarView?.frame ,
////         let scrollViewContainer = self.view.superview
////         else {
////
////            return }
////
//      let restHeightSpace = self.view.frame.height - navBarViewFrame.height
//      let resultFrame = CGRect(x: self.view.frame.minX,
//                               y: navBarViewFrame.height + containerView.frame.minY,
//                               width: self.view.frame.width,
//                               height: restHeightSpace)
//      customTransitiongDelegate.setupAnimator(_originFrame: resultFrame)
   }
   
   func updateTransitiong(accordingTo viewWithTag: Int) {
      let navBarView = view.subviews.filter { (subView) -> Bool in
         return subView.tag == viewWithTag
      }.first
      
      guard let navBarViewFrame = navBarView?.frame ,
         let scrollViewContainer = self.view.superview 
         else { return }
      
      let restHeightSpace = self.view.frame.height - navBarViewFrame.height
      let resultFrame = CGRect(x: self.view.frame.minX,
                               y: navBarViewFrame.height + scrollViewContainer.frame.minY, 
                               width: self.view.frame.width,
                               height: restHeightSpace)
      customTransitiongDelegate?.setupAnimator(_originFrame: resultFrame)
   }
   
   override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
      viewControllerToPresent.transitioningDelegate = customTransitiongDelegate
      viewControllerToPresent.modalPresentationStyle = .custom
      (viewControllerToPresent as? CustomAnimatedTrayViewController)?.customTransitiongDelegate = customTransitiongDelegate
      super.present(viewControllerToPresent, animated: true, completion: nil)
   }
}
