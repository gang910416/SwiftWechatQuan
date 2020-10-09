//
//  BaseTabbarViewController.swift
//  SwiftProject
//
//  Created by liugang on 2020/9/10.
//  Copyright © 2020 liugang. All rights reserved.
//

import UIKit

class BaseTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
  
        addChildViewController(childVc:HomeViewController(), title: "首页", imageName: "tab0")
        addChildViewController(childVc:FoundViewController(), title: "发现", imageName: "tab1")
        addChildViewController(childVc:MeViewController(), title: "我的", imageName: "tab2")
        // Do any additional setup after loading the view.
    }

    func addChildViewController(childVc:BaseViewController , title:String ,imageName:String)  {
        
        childVc.title = title;
        childVc.tabBarItem.image = UIImage(named: imageName);
        childVc.tabBarItem.selectedImage = UIImage(named: imageName + "_heightImage")
        tabBar.tintColor = UIColor.orange
        let nav = BaseNavGationViewController()
        nav.addChild(childVc)
        addChild(nav)
    }
    
    
}
