//
//  ToViewController.swift
//  NavigationTransition
//
//  Created by Salma Hassan on 7/15/20.
//  Copyright © 2020 salma. All rights reserved.
//

import UIKit

class SecondViewController: CustomAnimatedTrayViewController {
   
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
      super.viewDidLoad()
   }
   
   @IBAction func dismissBtnPressed(){
      self.presentingViewController?.dismiss(animated: true, completion: nil)
   }
   @IBAction func proceedBtnPressed(_ sender: Any) {
      let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: ThirdViewController.self))
      self.present(vc, animated: true, completion: nil)
   }
}
