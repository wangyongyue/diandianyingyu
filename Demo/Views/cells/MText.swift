//
//  MText.swift
//  Demo
//
//  Created by apple on 2019/12/12.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class MText: UITableViewCell {
        
    lazy private var nameLabel:UILabel = {
        let a = UILabel()
        a.textAlignment = .left
        a.font = UIFont.systemFont(ofSize: 15)
        a.text = "欢迎来到点点英语，选择自己喜欢的内容，\n完成挑战，记住不要放弃"
        a.numberOfLines = 0
        return a
    }()
   
    lazy private var line:UIView = {
        let a = UIView()
        a.backgroundColor = bgColor
        return a
    }()
    lazy private var tap:UITapGestureRecognizer = {
        let a = UITapGestureRecognizer()
        return a
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(self.nameLabel)
            
        self.contentView.addSubview(self.line)

        self.nameLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(16)
            make.left.equalTo(12)
            make.right.equalTo(-12)
            
        }
    
        self.line.snp.makeConstraints { (make) in
            
            make.height.equalTo(0.3)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
            
        }
        
        self.contentView.addGestureRecognizer(tap)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setV_Model(_ aModel: VueData) {
        if aModel is MTextModel{
            
            let m = aModel as! MTextModel
            
            tap.v_tap {
                m.v_identifier = 0
                m.v_to()
            }
        }
    }
}
class MTextModel:VueData{
    
    var name:String?
    
    override func v_height() -> CGFloat {
        
        return 84
    }
}
