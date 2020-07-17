//
//  TrayProtocol.swift
//  NavigationTransition
//
//  Created by Salma Hassan on 7/17/20.
//  Copyright © 2020 salma. All rights reserved.
//

import UIKit

protocol TrayProtocol {
   func promotionalNavigation()
}

extension TrayProtocol where Self: UIViewController {
   func promotionalNavigation(){
//      let navBar = UINavigationBar()
//      navBar.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 80)
//      self.view.addSubview(navBar)
      
//      self.navigationController?.navigationItem.prompt = "       "
      
   }
}


