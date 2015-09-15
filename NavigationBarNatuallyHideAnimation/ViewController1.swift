//
//  ViewController1.swift
//  NavigationBarNatuallyHideAnimation
//
//  Created by MORITANAOKI on 2015/09/15.
//  Copyright (c) 2015年 molabo. All rights reserved.
//

import UIKit

class ViewController1: UIViewController, NavigationBarHidable {
    
    static func instantiateFromNib() -> ViewController1 {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ViewController1") as! ViewController1
    }
    
    var navigationBarHidden = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "next"))
    }
    
    func next() {
        let r = arc4random_uniform(2)
        if r == 0 {
            let vc = ViewController1.instantiateFromNib()
            vc.navigationBarHidden = arc4random_uniform(2) == 0 ? false : true
            vc.view.backgroundColor = arc4random_uniform(2) == 0 ? UIColor.redColor() : UIColor.blueColor()
            navigationController?.pushViewController(vc, animated: true)
        } else {
            navigationController?.pushViewController(PageViewController.instantiateFromNib(), animated: true)
        }
    }
}
