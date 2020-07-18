//
//  ViewControllerExtension.swift
//  NavigationTransition
//
//  Created by Salma Hassan on 7/18/20.
//  Copyright © 2020 salma. All rights reserved.
//

import UIKit

extension UIViewController {
   
   func embedNavigationController(accordingTo viewWithTag: Int, recreationMethod method: () -> UIViewController) {
      let viewController = getCurrentVC()
      let containerFrame = getHeightWithoutCustomNavView(forVC: viewController, tag: viewWithTag)
      let navigationController = getNavigationVC(method, frame: containerFrame)
      viewController.view.addSubview(navigationController.view)
      viewController.addChild(navigationController)
      navigationController.didMove(toParent: viewController)
      updateNavViewFrame(forVC: navigationController.viewControllers.first , tag: viewWithTag)

   }
   
   private func getNavigationVC(_ method: () -> UIViewController, frame containerFrame: CGRect) -> UINavigationController{
      let vc = method()
      let navigationController = UINavigationController(rootViewController: vc)
      navigationController.view.frame = containerFrame
      return navigationController
   }
   
   func getCurrentVC() -> UIViewController {
      guard let navigationController = self as? UINavigationController,
      let viewController = navigationController.viewControllers.first  else { return self }
      return viewController
   }
   
   func updateNavViewFrame(forVC vc: UIViewController?, tag: Int){
      let navBarView = vc?.view.subviews.first(where: { $0.tag == tag })
      navBarView?.heightAnchor.constraint(equalToConstant: 0).isActive = true
      navBarView?.updateConstraints()
   }
   
   func getHeightWithoutCustomNavView(forVC vc: UIViewController, tag: Int) -> CGRect {
      let navBarView = vc.view.subviews.first(where: { $0.tag == tag })
   
      guard let navBarViewFrame = navBarView?.frame
         else { return .zero }
      
      let restHeightSpace = vc.view.frame.height - navBarViewFrame.height
      return  CGRect(x: vc.view.frame.minX,
                     y: navBarViewFrame.height,
                     width: vc.view.frame.width,
                     height: restHeightSpace)
   }
}
