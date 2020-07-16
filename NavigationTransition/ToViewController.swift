//
//  ToViewController.swift
//  NavigationTransition
//
//  Created by Salma Hassan on 7/15/20.
//  Copyright © 2020 salma. All rights reserved.
//

import UIKit

class ToViewController: UIViewController {
   
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
   
   override func viewDidLoad() {
   }
   
   @IBAction func dismissBtnPressed(){
      self.presentingViewController?.dismiss(animated: true, completion: nil)
   }
}
