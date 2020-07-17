//
//  TwoViewController.swift
//  NavigationTransition
//
//  Created by Salma Hassan on 7/16/20.
//  Copyright © 2020 salma. All rights reserved.
//

import UIKit

class TwoViewController: UIViewController {
   
//
//   override func viewWillDisappear(_ animated: Bool) {
//      UIView.setAnimationsEnabled(false)
//   }
//
//   override func viewDidDisappear(_ animated: Bool) {
//      UIView.setAnimationsEnabled(true)
//   }
   
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      navigationItem.setHidesBackButton(true, animated: true)
//      navigationItem.title = "Title"
    }
    

   @IBAction func backPressed(){
      navigationController?.popViewController(animated: true)
   }

}
