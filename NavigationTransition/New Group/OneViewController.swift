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

class OneViewController: UIViewController, CAAnimationDelegate {

//   override func viewWillDisappear(_ animated: Bool) {
//      UIView.setAnimationsEnabled(false)
//   }
//
//   override func viewDidDisappear(_ animated: Bool) {
//      UIView.setAnimationsEnabled(true)
//   }
   
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
   
//   override func viewWillAppear(_ animated: Bool) {
//      navigationController?.navigationBar.layer.removeAllAnimations()
//   }
   
    override func viewDidLoad() {
        super.viewDidLoad()
      
      
//      navigationController?.delegate = self
//        // Do any additional setup after loading the view.
      navigationController?.delegate = self
//      navigationController?.navigationBar.layer.removeAllAnimations()
    }
    

   @IBAction func btnPressed(){
      let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "two")
      navigationController?.pushViewController(vc, animated: false)
   }
   

}

extension OneViewController: UINavigationControllerDelegate {
   func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
      
      let transition = CATransition()
      transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
      transition.delegate = self
      self.navigationController!.visibleViewController?.view.layer.add(transition, forKey: kCATransition)
//      let navigationBarAnimation = CATransition()
//      navigationBarAnimation.duration = 100
//      navigationBarAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
//      navigationBarAnimation.type = CATransitionType.fade
////      navigationBarAnimation.subtype = CATransitionType.fade
////      navigationBarAnimation.isRemovedOnCompletion = true
//      navigationController.navigationBar.layer.add(navigationBarAnimation, forKey: nil)
   }

   func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
      navigationController.navigationBar.layer.removeAllAnimations()
   }
}

//class MyCustomNav: UINavigationBar {
//   override func setBackgroundImage(_ backgroundImage: UIImage?, for barMetrics: UIBarMetrics) {
//      return UIImage(named: "close")
//   }
//}


class MyCustomNavController: UINavigationController , UINavigationBarDelegate , UINavigationControllerDelegate {
   
//   let animation = NavigationAnimation()
   
   override func viewDidLoad() {
      self.navigationBar.setBackgroundImage(UIImage(), for: .default)
      self.navigationBar.shadowImage = UIImage()
      self.navigationBar.isTranslucent = true

      self.navigationBar.tintColor = .white
      self.navigationBar.backgroundColor = .blue
      
//      navigationController?.delegate = self
//      navigationBar.delegate = self
      
//      navigationBar.layer.removeAllAnimations()
      
//      let navigationBarAnimation = CATransition()
//            navigationBarAnimation.duration = 100
//            navigationBarAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
//            navigationBarAnimation.type = CATransitionType.fade
//      //      navigationBarAnimation.subtype = CATransitionType.fade
//      //      navigationBarAnimation.isRemovedOnCompletion = true
//            navigationBar.layer.add(navigationBarAnimation, forKey: nil)
      
   }
   
   func position(for bar: UIBarPositioning) -> UIBarPosition {
      return .topAttached
   }
   
   func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
         let navigationBarAnimation = CATransition()
         navigationBarAnimation.duration = 100
         navigationBarAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
         navigationBarAnimation.type = CATransitionType.fade
   //      navigationBarAnimation.subtype = CATransitionType.fade
   //      navigationBarAnimation.isRemovedOnCompletion = true
         navigationController.navigationBar.layer.add(navigationBarAnimation, forKey: nil)
      }

      func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
         navigationController.navigationBar.layer.removeAllAnimations()
      }
   
}

//class NavigationAnimation: NSObject, UINavigationControllerDelegate {
//   func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
//         let navigationBarAnimation = CATransition()
//         navigationBarAnimation.duration = 100
//         navigationBarAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
//         navigationBarAnimation.type = CATransitionType.fade
//   //      navigationBarAnimation.subtype = CATransitionType.fade
//   //      navigationBarAnimation.isRemovedOnCompletion = true
//         navigationController.navigationBar.layer.add(navigationBarAnimation, forKey: nil)
//      }
//
//      func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
//         navigationController.navigationBar.layer.removeAllAnimations()
//      }
//}
