//
//  ThirdViewController.swift
//  NavigationTransition
//
//  Created by Salma Hassan on 7/18/20.
//  Copyright © 2020 salma. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

   @IBAction func okBtnPressed(_ sender: Any) {
      self.dismiss(animated: true, completion: nil)
   }
   
   static func create() -> ThirdViewController {
      let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
      let vc = mainStoryboard.instantiateViewController(withIdentifier: String(describing: ThirdViewController.self)) as! ThirdViewController
      return vc
   }
   
}
