//
//  ViewController.swift
//  NavigationTransition
//
//  Created by Salma Hassan on 7/15/20.
//  Copyright © 2020 salma. All rights reserved.
//

import UIKit

class FirstViewController: CustomAnimatedTrayViewController  {
   
   @IBOutlet weak var navigationView: UIView!
   @IBOutlet weak var continueBtn: UIButton! {
      didSet{
         continueBtn.layer.cornerRadius = 4
      }
   }
   @IBOutlet weak var containerView: UIView!
   
   override func viewDidLoad() {
      super.viewDidLoad()
   }
   
   @IBAction func cancelBtnPressed(_ sender: Any) {
      dismiss(animated: true, completion: nil)
   }
   
   @IBAction func btnPressed(_ sender: Any) {
      let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
      guard let vc = mainStoryboard.instantiateViewController(withIdentifier: "to") as? ToViewController else { return }
      present(vc, animated: true, completion: nil)
   }
   
}




extension UINavigationController {
   
   func setCustomView(named viewNibName: String) {
      guard let customView = Bundle.main.loadNibNamed(viewNibName, owner: self, options: nil)?.first as? UIView else { return }
      
      customView.frame = CGRect(x: self.navigationBar.bounds.minX,
                                y: self.navigationBar.bounds.minY,
                                width: self.navigationBar.bounds.width,
                                height: 80)
      
      self.navigationBar.addSubview(customView)
   }
   
   func setCustomView(withView: UIView) {
      
      withView.frame = CGRect(x: self.navigationBar.bounds.minX,
                                y: self.navigationBar.bounds.minY,
                                width: self.navigationBar.bounds.width,
                                height: 80)
      
      self.navigationBar.addSubview(withView)
   }
}

extension UINavigationBar {
   func setCustomView(named viewNibName: String) {
      guard let customView = Bundle.main.loadNibNamed(viewNibName, owner: self, options: nil)?.first as? UIView else { return }
      
      customView.frame = CGRect(x: self.bounds.minX,
                                y: self.bounds.minY,
                                width: self.bounds.width,
                                height: 80)
      
      self.addSubview(customView)
   }
   
   func setCustomTitleView(named viewNibName: String) {
      guard let customView = Bundle.main.loadNibNamed(viewNibName, owner: self, options: nil)?.first as? UIView else { return }
      
      customView.frame = CGRect(x: self.frame.minX,
                                y: self.frame.minY,
                                width: self.frame.width,
                                height: 100)
      
      
   }
}

class CustomNavigationBarr: UINavigationBar {
  
    // NavigationBar height
    var customHeight : CGFloat = 80
  
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: customHeight)
    }
  
//    override func layoutSubviews() {
//        super.layoutSubviews()
//      
//        let y = UIApplication.shared.statusBarFrame.height
//        frame = CGRect(x: frame.origin.x, y:  y, width: frame.size.width, height: customHeight)
//      
//        for subview in self.subviews {
//            var stringFromClass = NSStringFromClass(subview.classForCoder)
//            if stringFromClass.contains("BarBackground") {
//                subview.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: customHeight)
//                subview.backgroundColor = self.backgroundColor
//            }
//          
//            stringFromClass = NSStringFromClass(subview.classForCoder)
//            if stringFromClass.contains("BarContent") {
//                subview.frame = CGRect(x: subview.frame.origin.x, y: 20, width: subview.frame.width, height: customHeight)
//                subview.backgroundColor = self.backgroundColor
//            }
//        }
//    }
}

