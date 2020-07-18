//
//  ThirdViewController.swift
//  NavigationTransition
//
//  Created by Salma Hassan on 7/18/20.
//  Copyright © 2020 salma. All rights reserved.
//

import UIKit

class ThirdViewController: CustomAnimatedTrayViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
   
   @IBAction func okBtnPressed(_ sender: Any) {
      self.parent?.dismiss(animated: true, completion: nil)
   }
   
}
