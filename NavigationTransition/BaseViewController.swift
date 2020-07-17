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
   
   
    override func viewDidLoad() {
        super.viewDidLoad()

        addContentController()
    }
   
   static func create(navigationMode:NavigationMode) -> BaseViewController {
          let storyboard = UIStoryboard(name:"Main" , bundle: Bundle.main)
          let vc = storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! BaseViewController
          switch navigationMode {
          case .normal :
            vc.contentViewController = navigationMode.controller
          case .push :
            vc.contentViewController = navigationMode.controller as? UINavigationController
          }
          return vc
      }
   

   private func addContentController() {
       contentViewController.view.frame = scrollView.bounds
       scrollView.addSubview(contentViewController.view)
       addChild(contentViewController)
       contentViewController.didMove(toParent: self)
      (contentViewController as? CustomAnimatedTrayViewController)?.update()
//      contentViewController.customAnimationSetupp()
//      (contentViewController as? Animatable)?.customAnimationSetup(accordingTo: -1000)
      
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
