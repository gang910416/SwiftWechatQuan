//
//  GlobalVariables.swift
//  SwiftProject
//
//  Created by liugang on 2020/9/10.
//  Copyright © 2020 liugang. All rights reserved.
//

import UIKit

let kSCREEN_WIDTH = UIScreen.main.bounds.size.width
let kSCREEN_HEIGHT = UIScreen.main.bounds.size.height
let kSCREEN_SIZE = UIScreen.main.bounds.size

let kSCREEN_SCALE = kSCREEN_WIDTH/750

func kSetRGBColor (r:CGFloat, g:CGFloat, b:CGFloat) -> UIColor {
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
}

func kSetRGBAColor (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    
}

func kMainColor() -> UIColor {
    return kSetRGBColor(r: 255, g: 93, b: 94)
}

func kTextColor() -> UIColor {
    return kSetRGBColor(r: 69, g: 69, b: 69)
}

func kBGColor() -> UIColor {
    return kSetRGBColor(r: 239, g: 239, b: 244)
}

func kGaryColor(num : NSInteger) -> UIColor {
    return kSetRGBColor(r: CGFloat(num), g: CGFloat(num), b: CGFloat(num))
}




//MARK: 获得渐变背景颜色
func getNavigationIMG(height: NSInteger , fromColor:UIColor,toColor:UIColor) -> UIImage {
    let view = UIView(frame: CGRect(x: 0, y: 0, width: Int(kSCREEN_WIDTH), height: height))
    view.layer.insertSublayer(getNavigationView(height: height, fromColor: fromColor, tocolor: toColor), at: 0)
    UIGraphicsBeginImageContext(view.bounds.size)
    view.layer.render(in: UIGraphicsGetCurrentContext()!)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image!
}
//MARK: 获得渐变背景颜色
func getNavigationView(height:NSInteger , fromColor:UIColor ,tocolor:UIColor) -> CAGradientLayer {
    let gradient = CAGradientLayer()
    gradient.frame = CGRect(x: 0, y: 0, width: Int(kSCREEN_WIDTH), height: height)
    gradient.colors = [fromColor.cgColor,tocolor.cgColor]
    gradient.startPoint = CGPoint.init(x: 0, y: 0.5)
    gradient.endPoint = CGPoint.init(x: 1, y: 0.5)
    return gradient
}


//MARK: 设置一个提醒

func setToast(str:String) {
    
    let window = UIApplication.shared.keyWindow
    
    let lastLabel = window?.viewWithTag(458443840)
    lastLabel?.removeFromSuperview()
    
    let width = getLabWidth(labelStr: str, font: UIFont.systemFont(ofSize: 15), height: 20)
    let label = UILabel.init(frame: CGRect (x: 0, y: 0, width: width + 12, height: 30))
    label.backgroundColor = kMainColor()
    label.layer.cornerRadius = 6
    label.clipsToBounds = true
    label.center = CGPoint(x: kSCREEN_WIDTH/2, y: kSCREEN_HEIGHT/2)
    label.textColor = UIColor.white
    label.text = str
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 15)
    label.alpha = 0
    label.tag = 458443840
    window?.addSubview(label)
    
    UIView.animate(withDuration: 0.15) {
        label.alpha = 1
    }
    
    let time: TimeInterval = 1.7
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
        
        UIView.animate(withDuration: 0.18, delay: 0, options: .layoutSubviews, animations: {
            label.alpha = 0
        }, completion: { (s) in
            label.removeFromSuperview()
            print("移除提醒")
        })
    }
}

//MARK:获取字符串的宽度的封装
func getLabWidth(labelStr:String,font:UIFont,height:CGFloat) -> CGFloat {
    
    let statusLabelText: NSString = labelStr as NSString
    
    let size = CGSize(width: 900, height: height)
    
    let dic = NSDictionary(object: font, forKey: NSAttributedString.Key.font as NSCopying)
    
    let strSize = statusLabelText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedString.Key : Any], context:nil).size
    
    return strSize.width
}


class GlobalVariables: NSObject {

}
