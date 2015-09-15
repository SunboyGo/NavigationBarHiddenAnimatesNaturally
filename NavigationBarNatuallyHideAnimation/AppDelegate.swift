//
//  AppDelegate.swift
//  NavigationBarNatuallyHideAnimation
//
//  Created by MORITANAOKI on 2015/09/15.
//  Copyright (c) 2015年 molabo. All rights reserved.
//

import UIKit

protocol NavigationBarHidable {
    var navigationBarHidden: Bool { get }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        if let nv = window?.rootViewController as? UINavigationController {
            nv.delegate = self
        }
        
        return true
    }
    
    func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
        navigationController.interactivePopGestureRecognizer.enabled = true
        navigationController.interactivePopGestureRecognizer.delegate = self
        
        if let vc = viewController as? NavigationBarHidable {
            if navigationController.navigationBarHidden != vc.navigationBarHidden {
                navigationController.setNavigationBarHidden(vc.navigationBarHidden, animated: animated)
            }
        }
    }
    
    func navigationController(navigationController: UINavigationController, didShowViewController viewController: UIViewController, animated: Bool) {
        if navigationController.viewControllers.count == 1 {
            navigationController.interactivePopGestureRecognizer.enabled = false
        }
    }
}

