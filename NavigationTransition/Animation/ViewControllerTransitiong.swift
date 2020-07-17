//
//  ViewControllerTransitiong.swift
//  NavigationTransition
//
//  Created by Salma Hassan on 7/17/20.
//  Copyright © 2020 salma. All rights reserved.
//

import UIKit

class ViewControllerTransitioning: NSObject, UIViewControllerTransitioningDelegate {
   let transition = CustomAnimator()
   
   func setupAnimator(_originFrame: CGRect, _duration: Double = 0.3){
      transition.originFrame = _originFrame
      transition.duration = _duration
   }
   
   
   func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
      transition.presenting = true
     return transition
   }

   func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
      transition.presenting = false
     return transition
   }
}
