//
//  BaseNavController.swift
//  LIVE812x
//
//  Created by loop on 2020/06/30.
//  Copyright © 2020 loop. All rights reserved.
//

import UIKit

class BaseNavController: UINavigationController {
    
    @IBInspectable open var clearBackTitle: Bool = true
    
    override open func viewDidLoad() {
        super.viewDidLoad()

        self.navigationBar.barTintColor = .white

        self.navigationBar.tintColor = UIColor.init(red: 38/255.0, green: 38/255.0, blue: 38/255.0, alpha: 1.0)

        self.interactivePopGestureRecognizer?.delegate = self
    }
    
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override open func pushViewController(_ viewController: UIViewController, animated: Bool) {
        controlClearBackTitle()
        
        super.pushViewController(viewController, animated: animated)
        
        
        if self.viewControllers.count > 1 {
            self.tabBarController?.tabBar.isHidden = true
        }else{
            self.tabBarController?.tabBar.isHidden = false
        }
    }
    
    override open func show(_ vc: UIViewController, sender: Any?) {
        controlClearBackTitle()
        super.show(vc, sender: sender)
        
    }
    
    open override func popViewController(animated: Bool) -> UIViewController? {
        
        if self.viewControllers.count == 2 {
            self.tabBarController?.tabBar.isHidden = false
        }
        
        return super.popViewController(animated: animated)
        
    }
    
}


// MARK: UIGestureRecognizerDelegate

extension BaseNavController: UIGestureRecognizerDelegate {
    
}

// MARK: Private Methods

extension BaseNavController {
    
    func controlClearBackTitle() {
        if clearBackTitle {
            topViewController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
    }
    
}
