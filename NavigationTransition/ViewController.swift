//
//  ViewController.swift
//  NavigationTransition
//
//  Created by Salma Hassan on 7/15/20.
//  Copyright © 2020 salma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
   @IBOutlet weak var continueBtn: UIButton! {
      didSet{
         continueBtn.layer.cornerRadius = 4
      }
   }
   @IBOutlet weak var containerView: UIView!
   let transition = PushAnimator()

   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view.
      
   }
   
   @IBAction func btnPressed(_ sender: Any) {
      
      guard let vc = storyboard?.instantiateViewController(identifier: "to") as? ToViewController else { return }
      vc.transitioningDelegate = self
      vc.modalPresentationStyle = .custom
      present(vc, animated: true, completion: nil)
   }
   
}

extension ViewController: UIViewControllerTransitioningDelegate {
   func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
      transition.originFrame = containerView.frame
      transition.presenting = true
     return transition
   }

   func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
      transition.presenting = false
     return transition
   }
}

