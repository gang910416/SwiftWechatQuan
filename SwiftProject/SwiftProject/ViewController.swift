//
//  ViewController.swift
//  SwiftProject
//
//  Created by liugang on 2020/9/10.
//  Copyright © 2020 liugang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        
        logFunction(logString:"lg123")
        
        let str:String = "122"
        print(str)
        
        for x in 0...10 {
            print("lg" + "\(x)")
        }
    
        var myString:String!
        myString = "wwwwwwww"
        if myString != nil {
            print(myString!)
        }else{
            print("字符串为 nil")
        }
        
        if myString.isEmpty {
            
        }
        
        var dic:NSMutableDictionary?
        
        var dic1:[Int:String] = [1:str]
        
        
    // Do any additional setup after loading the view.
    }

    func logFunc()  {
        print("hello my swift")
    }
    
    func logFunction(logString:String) -> String {
        let str = "123" + logString + "!"
        print(str)
        return str
    }
    
    
}

