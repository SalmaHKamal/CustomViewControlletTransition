//
//  PopupAnimator.swift
//  NavigationTransition
//
//  Created by Salma Hassan on 7/15/20.
//  Copyright © 2020 salma. All rights reserved.
//

import UIKit

class PushAnimator: NSObject, UIViewControllerAnimatedTransitioning {

   let duration = 0.3
  var presenting = true
  var originFrame = CGRect.zero

  var dismissCompletion: (()->Void)?

  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return duration
  }

  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
   let containerView = transitionContext.containerView
   guard let currentView = presenting ? transitionContext.view(forKey: .to) : transitionContext.view(forKey: .from) else { return }
   
   currentView.frame = CGRect(x: presenting ? originFrame.width : originFrame.minX ,
                               y: originFrame.minY,
                               width: originFrame.width,
                               height: originFrame.height)
   
   containerView.addSubview(currentView)
   
   UIView.animate(withDuration: duration, animations: {
      currentView.frame = CGRect(x: self.presenting ? self.originFrame.minX : self.originFrame.width ,
                                 y: self.originFrame.minY,
                                 width: self.originFrame.width,
                                 height: self.originFrame.height)
   }) { (_) in
      transitionContext.completeTransition(true)
   }
  }
}


