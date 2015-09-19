//
//  PageViewController.swift
//  NavigationBarNatuallyHideAnimation
//
//  Created by MORITANAOKI on 2015/09/15.
//  Copyright (c) 2015年 molabo. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate, NavigationBarHidable {

    var navigationBarHidden = false
    
    static func instantiateFromNib() -> PageViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("PageViewController") as! PageViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        delegate = self

//        // It's okay for PageCurl
//        if let nv = navigationController as? NavigationController {
//            nv.requiredToFailByInteractivePopGestureRecognizer(view.gestureRecognizers)
//        }
        
        // For Scroll
        if let nv = navigationController as? NavigationController {
            for v in view.subviews {
                if let s = v as? UIScrollView {
                    nv.requiredToFailByInteractivePopGestureRecognizer(s.gestureRecognizers)
                }
            }
        }
        
        let vc = ViewController.instantiateFromNib()
        vc.view.backgroundColor = UIColor.yellowColor()
        setViewControllers([vc], direction: .Forward, animated: false) { _ in }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let vc = ViewController.instantiateFromNib()
        vc.view.backgroundColor = color()
        return vc
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let vc = ViewController.instantiateFromNib()
        vc.view.backgroundColor = color()
        return vc
    }
    
    func color() -> UIColor {
        func r() -> CGFloat {
            return CGFloat(CGFloat(arc4random_uniform(255))/255.0)
        }
        return UIColor(red: r(), green: r(), blue: r(), alpha: 1.0)
    }
}
