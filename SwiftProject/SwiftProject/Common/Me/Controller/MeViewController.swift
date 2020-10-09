//
//  MeViewController.swift
//  SwiftProject
//
//  Created by liugang on 2020/9/10.
//  Copyright © 2020 liugang. All rights reserved.
//

import UIKit

class MeViewController: BaseViewController {
    
    var dataSource:Dictionary<Int, [String]>?
    override func viewDidLoad() {
        super.viewDidLoad()
        //        var dataSourse = [[String]]()
        //
        //        dataSourse.append(["我的收藏","我的订单","我的积分","我的分享"])
        //        dataSourse.append(["修改密码","夜间模式","清除缓存"])
        //        dataSourse.append(["退出登录"])
        self.dataSource =  [
            0:[String](["我的收藏","我的订单","我的积分","我的分享"]),
            1:[String](["修改密码","夜间模式","清除缓存"]),
            2:[String]([
                "退出登录"])
        ];
        // Do any additional setup after loading the view.
    }
    
    override func configSubViews() {
        
        tableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: kSCREEN_WIDTH, height: kSCREEN_HEIGHT - 64 - 49), style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cellID")
        self.view.addSubview(tableView)
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return  3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = self.dataSource?[section]
        return data!.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : UITableViewCell = tableView .dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        
        if dataSource == nil
        {
            return cell
        }
        
        let data = self.dataSource?[indexPath.section]
        
        if indexPath.section == 2 {
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.textColor = .red
        }
        cell.textLabel?.text = data![indexPath.row] as? String
        return cell
    }
}
