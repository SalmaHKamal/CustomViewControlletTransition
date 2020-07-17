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
      customizeNavBar()
   }
   
   @IBAction func btnPressed(_ sender: Any) {
      let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
      guard let vc = mainStoryboard.instantiateViewController(withIdentifier: "to") as? ToViewController else { return }
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


extension UIViewController {
   func customizeNavBar(){
      let customNavView = self.view.subviews.filter { (view) -> Bool in
         return view.tag == 999
      }
      
      guard let navView = customNavView.first else { return }
      
      navigationController?.navigationBar.isHidden = true
      navigationController?.navigationBar.addSubview(navView)
   }
}
