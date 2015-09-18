//
//  NavigationController.swift
//  NavigationBarNatuallyHideAnimation
//
//  Created by MORITANAOKI on 2015/09/17.
//  Copyright (c) 2015年 molabo. All rights reserved.
//

import UIKit

protocol NavigationBarHidable {
    var navigationBarHidden: Bool { get }
}

class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        interactivePopGestureRecognizer.delegate = self
    }
    
    func requiredToFailByInteractivePopGestureRecognizer(recognizers: [AnyObject]?) {
        if let recognizers = recognizers as? [UIGestureRecognizer] {
            for r in recognizers {
                r.requireGestureRecognizerToFail(interactivePopGestureRecognizer)
            }
        }
    }
}

// UINavigationControllerDelegate
extension NavigationController: UINavigationControllerDelegate {
    func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
        navigationController.interactivePopGestureRecognizer.enabled = true
        
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

// UIGestureRecognizerDelegate
extension NavigationController: UIGestureRecognizerDelegate {}

