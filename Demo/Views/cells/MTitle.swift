//
//  MTitle.swift
//  Demo
//
//  Created by apple on 2019/12/12.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class MTitle: UITableViewCell {
    
    lazy private var headImage:UIImageView = {
        let a = UIImageView()
        a.image = UIImage.init(named: "en_1")
        return a
    }()
    
    lazy private var nameLabel:UILabel = {
        let a = UILabel()
        a.textAlignment = .left
        a.font = UIFont.boldSystemFont(ofSize: 12)
        a.text = ""
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
        
        self.contentView.addSubview(self.headImage)
        self.contentView.addSubview(self.nameLabel)
    
        
        
        self.contentView.addSubview(self.line)

        self.headImage.snp.makeConstraints { (make) in
            
            make.top.equalTo(12)
            make.left.equalTo(12)
            
        }
        self.nameLabel.snp.makeConstraints { (make) in
            
            make.centerY.equalTo(self.headImage)
            make.left.equalTo(self.headImage.snp_rightMargin).offset(20)
            
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
        if aModel is MTitleModel{
            
            let m = aModel as! MTitleModel
            nameLabel.text = m.name
            tap.v_tap {
                m.v_identifier = 0
                m.v_to()
            }
        }
    }
}
class MTitleModel:VueData{
    
    var name:String?
    var type:String?

    convenience init(_ a:String){
        self.init()
        name = a
    }
    convenience init(_ a:String,_ b:String){
        self.init()
        name = a
        type = b
    }
    override func v_height() -> CGFloat {
        
        return 50
    }
}
