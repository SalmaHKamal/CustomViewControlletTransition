//
//  MainViewController.swift
//  NavigationTransition
//
//  Created by Salma Hassan on 7/17/20.
//  Copyright © 2020 salma. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
   
   @IBAction func startPressed(){
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let controller = storyboard.instantiateViewController(withIdentifier: String(describing: FirstViewController.self))
      let tray = BaseViewController.create(navigationMode: .normal(controller: controller))
      tray.modalPresentationStyle = .fullScreen
      present(tray, animated: true, completion: nil)
   }
}

