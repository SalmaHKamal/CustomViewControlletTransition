//
//  ToViewController.swift
//  NavigationTransition
//
//  Created by Salma Hassan on 7/15/20.
//  Copyright © 2020 salma. All rights reserved.
//

import UIKit

class ToViewController: UIViewController {
   
   override func viewDidLoad() {
   }
   
   @IBAction func dismissBtnPressed(){
      self.presentingViewController?.dismiss(animated: true, completion: nil)
   }
}
