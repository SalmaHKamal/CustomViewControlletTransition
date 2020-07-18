//
//  BaseViewController.swift
//  NavigationTransition
//
//  Created by Salma Hassan on 7/17/20.
//  Copyright © 2020 salma. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
   
   @IBOutlet weak var scrollView: UIScrollView!
   
   private var contentViewController: UIViewController!
   private var recreationMethod : (() -> UIViewController)!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      addContentController()
      navigationController?.setNavigationBarHidden(true, animated: true)
   }
   
   static func create(navigationMode:NavigationMode, recreationMethod method: @escaping ()-> UIViewController) -> BaseViewController {
      let storyboard = UIStoryboard(name:"Main" , bundle: Bundle.main)
      let vc = storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! BaseViewController
      switch navigationMode {
      case .normal :
         vc.contentViewController = navigationMode.controller
      case .push :
         vc.contentViewController = navigationMode.controller as? UINavigationController
      }
      vc.recreationMethod = method
      return vc
   }
   
   
   private func addContentController() {
      contentViewController.view.frame = scrollView.bounds
      scrollView.addSubview(contentViewController.view)
      addChild(contentViewController)
      contentViewController.didMove(toParent: self)
      contentViewController.embedNavigationController(accordingTo: -1000, recreationMethod: recreationMethod)
   }
   
}


enum NavigationMode {
   case normal(controller:UIViewController)
   case push(controller:UIViewController)
}
extension NavigationMode {
   var controller: UIViewController {
      switch self {
      case .normal(let controller):
         return controller
      case .push(let controller):
         return UINavigationController(rootViewController: controller)
         
      }
   }
}


