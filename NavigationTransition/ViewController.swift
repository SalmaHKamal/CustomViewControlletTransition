//
//  ViewController.swift
//  NavigationTransition
//
//  Created by Salma Hassan on 7/15/20.
//  Copyright © 2020 salma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
   let customTransitiongDelegate = ViewControllerTransitioning()
   var navigationViewTag: Int? = -1000
   
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
      
//      let customTransitiongDelegate = ViewControllerTransitioning()
      
      let navBarView = view.subviews.filter { (subView) -> Bool in
         return subView.tag == -1000
      }.first
      
      guard let navBarViewFrame = navBarView?.frame else { return }
      let restHeightSpace = self.view.frame.height - navBarViewFrame.height
      let resultFrame = CGRect(x: self.view.frame.minX,
                               //in case of your task I think you won't need to status bar height
                               y: navBarViewFrame.height + UIApplication.shared.statusBarFrame.height,
                               width: self.view.frame.width,
                               height: restHeightSpace)
      customTransitiongDelegate.setupAnimator(_originFrame: resultFrame, _duration: 0.3)
      
   }
   
//   override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
//      viewControllerToPresent.transitioningDelegate = customTransitiongDelegate
//      viewControllerToPresent.modalPresentationStyle = .custom
//      super.present(viewControllerToPresent, animated: true, completion: nil)
//   }
   
   @IBAction func btnPressed(_ sender: Any) {
      let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
      guard let vc = mainStoryboard.instantiateViewController(withIdentifier: "to") as? ToViewController else { return }
      vc.transitioningDelegate = customTransitiongDelegate
      vc.modalPresentationStyle = .custom
      present(vc, animated: true, completion: nil)
   }
   
}

