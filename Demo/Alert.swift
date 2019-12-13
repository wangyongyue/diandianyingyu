//
//  Alert.swift
//  Demo
//
//  Created by wangyongyue on 2019/8/22.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class Alert: UIView {

    static func show(str:String){
        
        let v = UIView()
        v.backgroundColor = UIColor.init(white: 0.6, alpha: 0.3)
        
        let window = UIApplication.shared.keyWindow
        v.frame = window?.bounds ?? CGRect.zero
        window?.addSubview(v)
        
        let label = UILabel()
        label.textColor = UIColor.black
        label.frame = CGRect.init(x: 50, y: v.frame.height/2 - 80, width: v.frame.width - 100, height: 50)
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        label.textAlignment = .center
        label.backgroundColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        v.addSubview(label)
        
        label.text = str
        
    
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {

            v.removeFromSuperview()
        }
        
        
    }
    static func loading(){
           
        let view = AlertView()
        view.backgroundColor = UIColor.init(white: 0.6, alpha: 0.3)
        let window = UIApplication.shared.keyWindow
        view.frame = window?.bounds ?? CGRect.zero
        window?.addSubview(view)
        let spinner = UIActivityIndicatorView.init(style: .whiteLarge)
        spinner.color = UIColor.white;
        spinner.center = view.center
        view.addSubview(spinner)
        spinner.startAnimating()
           
    }
    static func dissmiss(){
        let window = UIApplication.shared.keyWindow
        let arr = window?.subviews
        if let a = arr{
            for value in a{
                if value is AlertView{
                    value.removeFromSuperview()
                }
            }
           
        }
        
    }
    static func success(_ block:@escaping ()->()){
        
        let v = UIView()
        v.backgroundColor = UIColor.init(white: 0.6, alpha: 0.3)
        
        let window = UIApplication.shared.keyWindow
        v.frame = window?.bounds ?? CGRect.zero
        window?.addSubview(v)
        
        
        let bgView = UIView()
        v.addSubview(bgView)
        bgView.backgroundColor = lineColor
        bgView.frame = CGRect.init(x: 50, y: v.frame.height/2 - 50, width: v.frame.width - 100, height: 100)
        bgView.layer.cornerRadius = 10
        bgView.layer.masksToBounds = true
        
        let label = UILabel()
        label.textColor = Configuration.instructions.themeColor()
        label.frame = CGRect.init(x: 0, y: 0, width: v.frame.width - 100, height: 50)
        label.textAlignment = .center
        label.backgroundColor = UIColor.clear
        label.font = UIFont.systemFont(ofSize: 14)
        bgView.addSubview(label)
        
        label.text = "恭喜，继续下一个挑战"
        
        let button = UIButton()
        button.frame = CGRect.init(x: 0, y: 50, width: v.frame.width - 100, height: 50)
        button.backgroundColor = UIColor.clear
        button.setTitle("确定", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        bgView.addSubview(button)
        button.v_click {
            
            v.removeFromSuperview()
            block()

        }
    
     
        
    }
    

}
