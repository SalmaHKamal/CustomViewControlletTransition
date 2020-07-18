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
   
   @IBAction func cancelBtnPressed(_ sender: Any) {
      dismiss(animated: true, completion: nil)
   }
   
   @IBAction func btnPressed(_ sender: Any) {
      let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
      guard let vc = mainStoryboard.instantiateViewController(withIdentifier: String(describing: SecondViewController.self)) as? SecondViewController else { return }
      navigationController?.pushViewController(vc, animated: true)
   }
   
}




