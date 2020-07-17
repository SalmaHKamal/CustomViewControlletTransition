//
//  ViewController.swift
//  NavigationTransition
//
//  Created by Salma Hassan on 7/15/20.
//  Copyright © 2020 salma. All rights reserved.
//

import UIKit

class ViewController: CustomAnimatedTrayViewController  { //Animatable
   
//   var customTransitiongDelegate : UIViewControllerTransitioningDelegate? //ViewControllerTransitioning()
   
   @IBOutlet weak var continueBtn: UIButton! {
      didSet{
         continueBtn.layer.cornerRadius = 4
      }
   }
   @IBOutlet weak var containerView: UIView!{
      didSet{
         
      }
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
   
//      customTransitiongDelegate = customAnimationSetup(accordingTo: -1000)
      
////      let customTransitiongDelegate = ViewControllerTransitioning()
//
//      let navBarView = view.subviews.filter { (subView) -> Bool in
//         return subView.tag == -1000
//      }.first
//
//      guard let navBarViewFrame = navBarView?.frame else { return }
//      let restHeightSpace = self.view.frame.height - navBarViewFrame.height
//      let resultFrame = CGRect(x: self.view.frame.minX,
//                               //in case of your task I think you won't need to status bar height
//                               y: navBarViewFrame.height + UIApplication.shared.statusBarFrame.height,
//                               width: self.view.frame.width,
//                               height: restHeightSpace)
//      customTransitiongDelegate.setupAnimator(_originFrame: resultFrame, _duration: 0.3)
      
   }
   
//   override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
//      viewControllerToPresent.transitioningDelegate = customTransitiongDelegate
//      viewControllerToPresent.modalPresentationStyle = .custom
//      super.present(viewControllerToPresent, animated: true, completion: nil)
//   }
   
   
   @IBAction func cancelBtnPressed(_ sender: Any) {
      dismiss(animated: true, completion: nil)
   }
   
   @IBAction func btnPressed(_ sender: Any) {
      let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
      guard let vc = mainStoryboard.instantiateViewController(withIdentifier: "to") as? ToViewController else { return }
      present(vc, animated: true, completion: nil)
   }
   
}

extension UIViewController {
   
}



