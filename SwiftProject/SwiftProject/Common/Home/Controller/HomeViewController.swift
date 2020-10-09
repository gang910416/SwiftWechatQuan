//
//  HomeViewController.swift
//  SwiftProject
//
//  Created by liugang on 2020/9/10.
//  Copyright © 2020 liugang. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController, HJImageBrowserDelegate {

    let identyfier = "homeTableViewCell"
    var theImage = UIImage()
    var theIndex = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    
    override func configSubViews() {
        //设置title
        self.title = "朋友圈"
        tableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: kSCREEN_WIDTH, height: kSCREEN_HEIGHT - 64 - 49), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 143 * kSCREEN_SCALE
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: identyfier)
        self.view.addSubview(tableView)
        
        let  rightItem = UIButton.init(type: .custom)
        rightItem.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
        rightItem.setTitle("跳转", for: .normal)
        rightItem.addTarget(self, action: #selector(pushVcClick), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: rightItem)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 20
        }
        
        override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell : HomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: identyfier, for: indexPath) as! HomeTableViewCell
            cell.selectionStyle = .default
            
            let num = Int(arc4random_uniform(6))+1
//            if num == 0 {
//                num = 7
//            }
            
//            if indexPath.row == 0 {
//                num = 8
//            }
//
            cell.assignToViews(num: num)

            cell.showImageAction = {
                
                self.theImage = $2
                self.theIndex = $0
//                
                let bview = HJImageBrowser()

                bview.delegate = self

                
    //            bottomView 这个一定要填写你点击的imageView的直接父视图
    //            cell.viewWithTag(10086) 这个就是cell类里面的那个images（UIView）我在Xib里面设置的
                bview.bottomView = cell.viewWithTag(10086)

    //            当前点击的图片在该数组中的位置。
                bview.indexImage = $0

                bview.defaultImage = $2

                bview.arrayImage = $1 as? [String]

                bview.show()
                
            }
            
            return cell
        }
        
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            
            self.navigationController?.pushViewController(MeViewController(), animated: true)

        }
        
    
    @objc func pushVcClick() {
        
        self.navigationController?.pushViewController(MeViewController(), animated: true)
    }
    
        //    #MARK:HJImageBrowserDelegate
        func getTheThumbnailImage(_ indexRow: Int) -> UIImage {
    //        点击图片之后，放大过程中显示的那张图片
            return theImage
        }

}
