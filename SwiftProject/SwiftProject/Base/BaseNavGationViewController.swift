//
//  BaseNavGationViewController.swift
//  SwiftProject
//
//  Created by liugang on 2020/9/10.
//  Copyright © 2020 liugang. All rights reserved.
//

import UIKit

class BaseNavGationViewController: UINavigationController,UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.interactivePopGestureRecognizer?.delegate = self
        
        self.navigationItem.leftBarButtonItem?.tintColor  = kSetRGBColor(r: 255, g: 255, b: 255)
         self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        
        UIApplication.shared.statusBarStyle = .lightContent
         self.navigationBar.setBackgroundImage(getNavigationIMG(height: 64, fromColor: kSetRGBColor(r: 253, g: 100, b: 104), toColor: kSetRGBColor(r: 235, g: 133, b: 142)), for: .default)
        let dict:NSDictionary = [NSAttributedString.Key.foregroundColor: UIColor.white,NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)]
        //标题颜色
        self.navigationBar.titleTextAttributes = dict as? [NSAttributedString.Key : AnyObject]
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            let  backBtn = UIButton()
            backBtn.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
            backBtn.setImage(UIImage(named: "back_white"), for: .normal)
            backBtn.addTarget(self, action: #selector(backClick), for: .touchUpInside)
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: backBtn)
        }
        super.pushViewController(viewController, animated:true)
    }
    
    
    @objc func backClick() {
        if ((self.presentingViewController) != nil) {
            self.dismiss(animated: true, completion: nil)
        }else{
            self.popViewController(animated: true)
        }
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return self.children.count > 1
    }

}
