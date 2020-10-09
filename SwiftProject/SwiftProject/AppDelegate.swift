//
//  AppDelegate.swift
//  SwiftProject
//
//  Created by liugang on 2020/9/10.
//  Copyright © 2020 liugang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow? ;
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = BaseTabbarViewController()
        self.window?.makeKeyAndVisible()
        // Override point for customization after application launch.
        return true
    }



}

