//
//  ToViewController.swift
//  NavigationTransition
//
//  Created by Salma Hassan on 7/15/20.
//  Copyright © 2020 salma. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
   
   @IBOutlet weak var alertView: UIView!{
      didSet {
         alertView.layer.cornerRadius = 4
      }
   }
   
   @IBOutlet weak var dismissBtn: UIButton! {
      didSet{
         dismissBtn.layer.cornerRadius = 4
      }
   }
   
   @IBOutlet weak var proceedBtn: UIButton! {
      didSet{
         proceedBtn.layer.cornerRadius = 4
      }
   }
   
   static func create() -> SecondViewController {
      let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
      let vc = mainStoryboard.instantiateViewController(withIdentifier: String(describing: SecondViewController.self)) as! SecondViewController
      return vc
   }
   
   @IBAction func dismissBtnPressed(){
      navigationController?.popViewController(animated: true)
   }
   
   @IBAction func proceedBtnPressed(_ sender: Any) {
      let vc = ThirdViewController.create()
      navigationController?.pushViewController(vc, animated: true)
   }
}
