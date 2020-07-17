//
//  OneViewController.swift
//  NavigationTransition
//
//  Created by Salma Hassan on 7/16/20.
//  Copyright © 2020 salma. All rights reserved.
//

import UIKit

class OneViewController: UIViewController { //, CAAnimationDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
      
      navigationController?.delegate = self
      self.navigationController?.setNavigationBarHidden(false, animated: false)
      let customNavigationBar = UIView(frame: CGRect(x: navigationController?.navigationBar.bounds.minX ?? 0, y: navigationController?.navigationBar.bounds.minY ?? 0 , width: navigationController?.navigationBar.bounds.width ?? 0, height: 100))
      customNavigationBar.backgroundColor = .green
      navigationController?.navigationBar.addSubview(customNavigationBar)
//      self.navigationBar.addSubview(customNavigationBar)
    }
    

   @IBAction func btnPressed(){
      let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "two")
      navigationController?.pushViewController(vc, animated: true)
      print(navigationController?.navigationBar.frame)
   }
   
}



extension OneViewController: UINavigationControllerDelegate {
   
   func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
      
      let navigationBarAnimation = CATransition()
      navigationBarAnimation.duration = 100
      self.navigationController?.navigationBar.layer.add(navigationBarAnimation, forKey: nil)
   }

   func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
      navigationController.navigationBar.layer.removeAllAnimations()
   }
}

class CustomNavigationBar: UINavigationBar {
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let newSize :CGSize = CGSize(width: self.frame.size.width, height: 200)
        return newSize
    }
}

