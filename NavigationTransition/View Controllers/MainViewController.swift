//
//  MainViewController.swift
//  NavigationTransition
//
//  Created by Salma Hassan on 7/17/20.
//  Copyright © 2020 salma. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

   @IBOutlet weak var chargeBtn: UIButton! {
      didSet {
         chargeBtn.layer.cornerRadius = 4
      }
   }

   
   @IBAction func startPressed(){
      let controller = FirstViewController.create()
      let controllerCopy = FirstViewController.create()
      let tray = BaseViewController.create(navigationMode: .push(controller: controller), vcCopy: controllerCopy)
      tray.modalPresentationStyle = .fullScreen
      present(tray, animated: true, completion: nil)
   }
}



