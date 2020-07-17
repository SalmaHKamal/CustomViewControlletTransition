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
//   let transition = PushAnimator()
   let navigationAnimation = CustomNavigationAnimation()

   override func viewDidLoad() {
      super.viewDidLoad()
      navigationItem.title = "salma"
//      self.navigationController?.setNavigationBarHidden(false, animated: false)
//      navigationItem.title = "salma"
//      navigationController?.delegate = navigationAnimation
   }
   
   @IBAction func btnPressed(_ sender: Any) {
      let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
      guard let vc = mainStoryboard.instantiateViewController(withIdentifier: "to") as? ToViewController else { return }
      navigationController?.pushViewController(vc, animated: true)
//      vc.transitioningDelegate = self
//      vc.modalPresentationStyle = .custom
//      present(vc, animated: true, completion: nil)
   }
   
}

class CustomNavigationAnimation: NSObject, UINavigationControllerDelegate {
   func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
      
      let navigationBarAnimation = CATransition()
      navigationBarAnimation.duration = 100
      navigationController.navigationBar.layer.add(navigationBarAnimation, forKey: nil)
   }

   func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
      navigationController.navigationBar.layer.removeAllAnimations()
   }
}

extension ViewController: UINavigationControllerDelegate {
   
   func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
      
      let navigationBarAnimation = CATransition()
      navigationBarAnimation.duration = 100
      self.navigationController?.navigationBar.layer.add(navigationBarAnimation, forKey: nil)
   }

   func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
      navigationController.navigationBar.layer.removeAllAnimations()
   }
}

class CustomizedNavigationController: UINavigationController {
   let navigationAnimation = CustomNavigationAnimation()
   
   override func viewDidLoad() {
      
      self.delegate = navigationAnimation
      navigationBar.setCustomView(named: "CustomNavigationBarView" )

   }
}

extension UINavigationController {
   
   
   func stopAnimation(){
      let navigationAnimation = CustomNavigationAnimation()
      self.delegate = navigationAnimation
   }
}

extension UINavigationBar {
   func setCustomView(named viewNibName: String) {
      guard let customView = Bundle.main.loadNibNamed(viewNibName, owner: self, options: nil)?.first as? UIView else { return }
      
      customView.frame = CGRect(x: self.bounds.minX,
                                y: self.bounds.minY,
                                width: self.bounds.width,
                                height: 100)
      
      self.addSubview(customView)
   }
}

class CustomNavigationBarr: UINavigationBar {
  
    // NavigationBar height
    var customHeight : CGFloat = 80
  
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: customHeight)
    }
  
//    override func layoutSubviews() {
//        super.layoutSubviews()
//      
//        let y = UIApplication.shared.statusBarFrame.height
//        frame = CGRect(x: frame.origin.x, y:  y, width: frame.size.width, height: customHeight)
//      
//        for subview in self.subviews {
//            var stringFromClass = NSStringFromClass(subview.classForCoder)
//            if stringFromClass.contains("BarBackground") {
//                subview.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: customHeight)
//                subview.backgroundColor = self.backgroundColor
//            }
//          
//            stringFromClass = NSStringFromClass(subview.classForCoder)
//            if stringFromClass.contains("BarContent") {
//                subview.frame = CGRect(x: subview.frame.origin.x, y: 20, width: subview.frame.width, height: customHeight)
//                subview.backgroundColor = self.backgroundColor
//            }
//        }
//    }
}

//extension ViewController: UIViewControllerTransitioningDelegate {
//   func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//      transition.originFrame = containerView.frame
//      transition.presenting = true
//     return transition
//   }
//
//   func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//      transition.presenting = false
//     return transition
//   }
//}


//extension UIViewController {
//   func customizeNavBar(){
//      let customNavView = self.view.subviews.filter { (view) -> Bool in
//         return view.tag == 999
//      }
//
//      guard let navView = customNavView.first else { return }
//
//      navigationController?.navigationBar.isHidden = true
//      navigationController?.navigationBar.addSubview(navView)
//   }
//}
