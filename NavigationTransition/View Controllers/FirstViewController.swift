//
//  ViewController.swift
//  NavigationTransition
//
//  Created by Salma Hassan on 7/15/20.
//  Copyright © 2020 salma. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController  {
   var isBaseVCInContainer: Bool?
   
   @IBOutlet weak var continueBtn: UIButton! {
      didSet{
         continueBtn.layer.cornerRadius = 4
      }
   }
   @IBOutlet weak var containerView: UIView!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      navigationController?.setNavigationBarHidden(true, animated: true)
   }
   
   static func create() -> FirstViewController {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let controller = storyboard.instantiateViewController(withIdentifier: String(describing: FirstViewController.self)) as! FirstViewController
      return controller
   }
   
   @IBAction func cancelBtnPressed(_ sender: Any) {
      dismiss(animated: true, completion: nil)
   }
   
   @IBAction func btnPressed(_ sender: Any) {
      let vc = SecondViewController.create()
      navigationController?.pushViewController(vc, animated: true)
   }
   
  
   
}




