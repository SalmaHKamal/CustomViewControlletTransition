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
//      navigationItem.title = "salma"
      navigationItem.setHidesBackButton(true, animated: false)
//      navigationItem.prompt = "        "
   }
   
   @IBAction func dismissBtnPressed(){
      navigationController?.popViewController(animated: true)
//      self.presentingViewController?.dismiss(animated: true, completion: nil)
   }
}


//
//static func create(navigationMode:NavigationMode) -> VFBottomOverlayController {
//    let storyboard = UIStoryboard(name:VFStoryboardName.bottomOverlay.rawValue, bundle: Bundle.main)
//    let vc = storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! VFBottomOverlayController
//    switch navigationMode {
//    case .normal :
//        vc.contentViewController = navigationMode.controller
//    case .push :
//        vc.contentViewController = navigationMode.controller as? UINavigationController
//    }
//    return vc
//}
