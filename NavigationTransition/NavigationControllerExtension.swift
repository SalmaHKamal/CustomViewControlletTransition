//
//  NavigationControllerExtension.swift
//  NavigationTransition
//
//  Created by Salma Hassan on 7/17/20.
//  Copyright © 2020 salma. All rights reserved.
//

import UIKit

extension UINavigationController {
   
   func setCustomView(named viewNibName: String, _height: CGFloat) {
      guard let customView = Bundle.main.loadNibNamed(viewNibName, owner: self, options: nil)?.first as? UIView else { return }
      
      customView.frame = CGRect(x: self.navigationBar.bounds.minX,
                                y: self.navigationBar.bounds.minY,
                                width: self.navigationBar.bounds.width,
                                height: _height)
      
      self.navigationBar.addSubview(customView)
   }
}
