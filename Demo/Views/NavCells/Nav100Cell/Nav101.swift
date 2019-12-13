//
//  Nav101Cell.swift
//  Demo
//
//  Created by wangyongyue on 2019/12/10.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class Nav101: UITableViewCell {
    
    let headerLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = Configuration.instructions.navigtaionTextColor()
        label.backgroundColor = UIColor.clear
        return label
    }()
    
    lazy private var leftButton:UIButton = {
        let a = UIButton()
        a.setTitle("标题", for: .normal)
        a.setTitleColor(UIColor.black, for: .normal)
        return a
    }()
    lazy private var middleButton:UIButton = {
        let a = UIButton()
        a.setImage(UIImage.init(named: "subSearch"), for: .normal)
        a.setTitle(" 搜索", for: .normal)
        a.setTitleColor(UIColor.lightGray, for: .normal)
        a.layer.cornerRadius = 15
        a.layer.masksToBounds = true
        a.backgroundColor = UIColor.white
        a.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        return a
    }()
    lazy private var rightButton:UIButton = {
        let a = UIButton()
        a.setImage(UIImage.init(named: "mine"), for: .normal)

        return a
    }()
    
    
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear

        self.contentView.addSubview(leftButton)
        self.contentView.addSubview(middleButton)
        self.contentView.addSubview(rightButton)

        
        leftButton.snp.makeConstraints { (make) in
            
            make.centerY.equalTo(self.contentView)
            make.left.equalTo(15)
        }
       
        rightButton.snp.makeConstraints { (make) in
            
            make.centerY.equalTo(self.contentView)
            make.right.equalTo(-15)
        }
        middleButton.snp.makeConstraints { (make) in
               
            make.centerY.equalTo(self.contentView)
            make.left.equalTo(80)
            make.right.equalTo(-50)
            make.height.equalTo(30)

        }
           
    
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setV_Model(_ aModel: VueData) {
        if aModel is Nav101Model{
            let m = aModel as! Nav101Model
        
            middleButton.v_click {
                m.v_identifier = 0
                m.v_to()
            }
            rightButton.v_click {
                m.v_identifier = 1
                m.v_to()
            }
           
        }
    }
    
}
class Nav101Model:VueData{
    
    var name:String?
    override func v_height() -> CGFloat {

        return 40
    }
  
}

