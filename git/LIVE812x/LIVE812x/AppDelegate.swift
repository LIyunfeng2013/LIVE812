//
//  AppDelegate.swift
//  LIVE812x
//
//  Created by loop on 2020/06/30.
//  Copyright © 2020 loop. All rights reserved.
//

import UIKit
import ESTabBarController_swift
import IQKeyboardManagerSwift
import Localize_Swift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?;
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        IQKeyboardManager.shared.enable = true;// 控制整个功能是否启用
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true;// 控制点击背景是否收起键盘
        IQKeyboardManager.shared.shouldToolbarUsesTextFieldTintColor = true;// 控制键盘上的工具条文字颜色是否用户自定义
        IQKeyboardManager.shared.toolbarManageBehaviour = IQAutoToolbarManageBehaviour.bySubviews;// 有多个输入框时，可以通过点击Toolbar 上的“前一个”“后一个”按钮来实现移动到不同的输入框
        IQKeyboardManager.shared.enableAutoToolbar = true; // 控制是否显示键盘上的工具条
        IQKeyboardManager.shared.shouldShowToolbarPlaceholder = true;// 是否显示占位文字
        IQKeyboardManager.shared.placeholderFont = UIFont.systemFont(ofSize: 17);// 设置占位文字的字体
///        IQKeyboardManager.shared.keyboardDistanceFromTextField = 10.0
        
        let frame = UIScreen.main.bounds;
        window = UIWindow(frame: frame);

        if let window = self.window {
            window.rootViewController = creatSubControllers();
            window.makeKeyAndVisible();
        }
        
        return true;
    }
    
    
    ///创建子控制器
    func creatSubControllers() -> ESTabBarController {
        let tabBarController = ESTabBarController();
        tabBarController.tabBar.backgroundColor = .white;
        
        let homeVC1 = HomeController();
        let homeVC2 = FindController();
        let homeVC3 = CameraController();
        let homeVC4 = FavorController();
        let homeVC5 = MeController();
        
        homeVC1.tabBarItem = ESTabBarItem.init(BouncesContentVIEW(), title: "HOME".localized(), image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"));
        homeVC2.tabBarItem = ESTabBarItem.init(BouncesContentVIEW(), title: "FIND".localized(), image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"));
        homeVC3.tabBarItem = ESTabBarItem.init(BouncesContentVIEW(), title: "CAMERA".localized(), image: UIImage(named: "photo"), selectedImage: UIImage(named: "photo_1"));
        homeVC4.tabBarItem = ESTabBarItem.init(BouncesContentVIEW(), title: "FAVOR".localized(), image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"));
        homeVC5.tabBarItem = ESTabBarItem.init(BouncesContentVIEW(), title: "ME".localized(), image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"));
        
        let homeNav1 = BaseNavController.init(rootViewController: homeVC1);
        let homeNav2 = BaseNavController.init(rootViewController: homeVC2);
        let homeNav3 = BaseNavController.init(rootViewController: homeVC3);
        let homeNav4 = BaseNavController.init(rootViewController: homeVC4);
        let homeNav5 = BaseNavController.init(rootViewController: homeVC5);
        
        tabBarController.viewControllers = [homeNav1, homeNav2, homeNav3, homeNav4, homeNav5];
        
        return tabBarController;
    }
}




