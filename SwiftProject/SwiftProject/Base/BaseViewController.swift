//
//  BaseViewController.swift
//  SwiftProject
//
//  Created by liugang on 2020/9/10.
//  Copyright © 2020 liugang. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
   

    var tableView = UITableView()
    //数据源
    var dataSourse = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
        self.view.backgroundColor =  kSetRGBColor(r: 239, g: 239, b: 239)
        configSubViews()
        configNavgationBarMainColor()
        
    }
    
    func configSubViews()  {
        
    }
    
    func configNavgationBarMainColor()  {
       
    }
    
    
 //    ******************代理 ： UITableViewDataSource,UITableViewDelegate  ************
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 1
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

}
