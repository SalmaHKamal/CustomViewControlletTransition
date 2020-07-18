//
//  BaseViewController.swift
//  NavigationTransition
//
//  Created by Salma Hassan on 7/17/20.
//  Copyright © 2020 salma. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
   
   @IBOutlet weak var scrollView: UIScrollView!
   
   private var contentViewController: UIViewController!
//   var contentViewControllerLoadingType: Viewc
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      addContentController()
      navigationController?.setNavigationBarHidden(true, animated: true)
   }
   
   static func create(navigationMode:NavigationMode) -> BaseViewController {
      let storyboard = UIStoryboard(name:"Main" , bundle: Bundle.main)
      let vc = storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! BaseViewController
      switch navigationMode {
      case .normal :
         vc.contentViewController = navigationMode.controller
      case .push :
         vc.contentViewController = navigationMode.controller as? UINavigationController
      }
      return vc
   }
   
   
   private func addContentController() {
      contentViewController.view.frame = scrollView.bounds
      scrollView.addSubview(contentViewController.view)
      addChild(contentViewController)
      contentViewController.didMove(toParent: self)
      contentViewController.embedNavigationController(accordingTo: -1000, loadingType: .storyboard(storboardName: "Main", vcIdentifier: String(describing: contentViewController.getCurrentVC().classForCoder.self))) // navigation custome view tag as identifier
   }
   
   
}

enum ViewControllerLoadType {
//   case nib
   case storyboard(storboardName: String, vcIdentifier: String)
}

extension UIViewController {
   
   private func loadViewController(loadType type: ViewControllerLoadType) -> UIViewController {
      switch type {
      case .storyboard(let storyboardName , let vcID):
         let storyboard = UIStoryboard(name: storyboardName , bundle: nil)
         let vc = storyboard.instantiateViewController(withIdentifier: vcID)
         return vc
//      default: return
      }
   }
   
   func getCurrentVC() -> UIViewController {
      guard let navigationController = self as? UINavigationController,
      let viewController = navigationController.viewControllers.first  else { return self }
      return viewController
   }
   
   private func getNavigationVC(loadingType type: ViewControllerLoadType, frame containerFrame: CGRect) -> UINavigationController{
      let vc = loadViewController(loadType: type)
      let navigationController = UINavigationController(rootViewController: vc)
      navigationController.view.frame = containerFrame
      return navigationController
   }
   
   func embedNavigationController(accordingTo viewWithTag: Int, loadingType type: ViewControllerLoadType) {
      let viewController = getCurrentVC()
      let containerFrame = getHeightWithoutCustomNavView(forVC: viewController, tag: viewWithTag)
      let navigationController = getNavigationVC(loadingType: type, frame: containerFrame)
      viewController.view.addSubview(navigationController.view)
      viewController.addChild(navigationController)
      navigationController.didMove(toParent: viewController)
      updateNavViewFrame(forVC: navigationController.viewControllers.first , tag: viewWithTag)

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
      
      let restHeightSpace = self.view.frame.height - navBarViewFrame.height
      return  CGRect(x: self.view.frame.minX,
                     y: navBarViewFrame.height,
                     width: self.view.frame.width,
                     height: restHeightSpace)
   }
}


enum NavigationMode {
   case normal(controller:UIViewController)
   case push(controller:UIViewController)
}
extension NavigationMode {
   var controller: UIViewController {
      switch self {
      case .normal(let controller):
         return controller
      case .push(let controller):
         return UINavigationController(rootViewController: controller)
         
      }
   }
   
}
