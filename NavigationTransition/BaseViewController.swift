//
//  BaseViewController.swift
//  NavigationTransition
//
//  Created by Salma Hassan on 7/17/20.
//  Copyright © 2020 salma. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
   static func create(navigationMode:NavigationMode) -> MainViewController {
          let storyboard = UIStoryboard(name:"from" , bundle: Bundle.main)
          let vc = storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! ViewController
          switch navigationMode {
          case .normal :
            return vc
              //vc.contentViewController = navigationMode.controller
          case .push :
            return navigationMode.controller as? UINavigationController
   //           vc.contentViewController = navigationMode.controller as? UINavigationController
          }
          return vc
      }
   
   @IBAction func startPressed(){
      
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
