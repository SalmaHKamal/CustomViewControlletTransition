//
//  ViewController.swift
//  NavigationTransition
//
//  Created by Salma Hassan on 7/15/20.
//  Copyright © 2020 salma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
   @IBOutlet weak var navigationView: UIView!
   @IBOutlet weak var continueBtn: UIButton! {
      didSet{
         continueBtn.layer.cornerRadius = 4
      }
   }
   @IBOutlet weak var containerView: UIView!
   let navigationAnimation = CustomNavigationAnimation()

   override func viewDidLoad() {
      super.viewDidLoad()
      //to stop animation
      navigationController?.delegate = navigationAnimation
      //to handle view height
      navigationController?.setCustomView(named: "CustomNavigationBarView", _height: 80)
   }
   
   @IBAction func btnPressed(_ sender: Any) {
      let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
      guard let vc = mainStoryboard.instantiateViewController(withIdentifier: "to") as? ToViewController else { return }
      navigationController?.pushViewController(vc, animated: true)
   }
   
}




