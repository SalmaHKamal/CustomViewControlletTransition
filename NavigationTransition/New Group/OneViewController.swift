//
//  OneViewController.swift
//  NavigationTransition
//
//  Created by Salma Hassan on 7/16/20.
//  Copyright © 2020 salma. All rights reserved.
//

import UIKit

//extension UINavigationBar {
//
//    override open func sizeThatFits(_ size: CGSize) -> CGSize {
//        return CGSize(width: UIScreen.main.bounds.size.width, height: 80.0)
//    }
//
//}

class OneViewController: UIViewController { //, CAAnimationDelegate

   override func viewDidAppear(_ animated: Bool) {
//      navigationController?.navigationBar.sizeThatFits(CGSize(width: UIScreen.main.bounds.size.width, height: 80.0))
//      for subview in (self.navigationController?.navigationBar.subviews)! {
//         if NSStringFromClass(subview.classForCoder).contains("BarBackground") {
//              var subViewFrame: CGRect = subview.frame
//              // subViewFrame.origin.y = -20;
//              subViewFrame.size.height = 100
//              subview.frame = subViewFrame
//
//          }
//
//      }
   }
   
    override func viewDidLoad() {
        super.viewDidLoad()
      
      navigationController?.delegate = self
    }
    

   @IBAction func btnPressed(){
      let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "two")
      navigationController?.pushViewController(vc, animated: true)
   }
   

}



extension OneViewController: UINavigationControllerDelegate {
   
   func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
      
      let navigationBarAnimation = CATransition()
      navigationBarAnimation.duration = 100
//      navigationBarAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
//      navigationBarAnimation.type = CATransitionType.push
////      navigationBarAnimation.subtype = kCATransitionFade
//      navigationBarAnimation.isRemovedOnCompletion = true
      self.navigationController?.navigationBar.layer.add(navigationBarAnimation, forKey: nil)
      
////      UIView.transition(from: (self.navigationController?.visibleViewController!.view)!, to: viewController.view, duration: 0.5, options: .curveEaseOut) { (_) in
////         <#code#>
////      }
//
//
////      let transition = CATransition()
////      transition.duration = 0.3
////        transition.type = CATransitionType.push
////      transition.subtype = UINavigationController.Operation.push ? CATransitionSubtype.fromRight : CATransitionSubtype.fromRight
////        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
//////      transition.delegate = self
////      self.navigationController!.visibleViewController?.view.layer.add(transition, forKey: kCATransition)
//      let navigationBarAnimation = CATransition()
//      navigationBarAnimation.duration = 100
//      navigationBarAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
//      navigationBarAnimation.type = CATransitionType.push
////      navigationBarAnimation.subtype = CATransitionType.fade
////      navigationBarAnimation.isRemovedOnCompletion = true
//      navigationController.navigationBar.layer.add(navigationBarAnimation, forKey: nil)
   }

   func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
      navigationController.navigationBar.layer.removeAllAnimations()
   }
}


