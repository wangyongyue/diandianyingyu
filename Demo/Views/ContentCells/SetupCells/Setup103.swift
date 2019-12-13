//
//  Setup103.swift
//  Demo
//
//  Created by apple on 2019/12/11.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class Setup103: UITableViewCell {
    
    lazy private var label:UILabel = {
        let a = UILabel()
        a.textAlignment = .left
        return a
    }()
   
    lazy private var footImage:UIImageView = {
        let a = UIImageView()
        a.image = UIImage.init(named: "mine_right")
        return a
    }()
    lazy private var line:UIView = {
        let a = UIView()
        a.backgroundColor = UIColor.lightGray
        return a
    }()
    lazy private var tap:UITapGestureRecognizer = {
        let a = UITapGestureRecognizer()
        return a
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(self.label)
        self.contentView.addSubview(self.line)
        self.contentView.addSubview(self.footImage)

        
        self.label.snp.makeConstraints { (make) in
            
            make.top.equalTo(12)
            make.left.equalTo(12)
        }
        
        self.footImage.snp.makeConstraints { (make) in
            
            make.centerY.equalTo(self.label)
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
        if aModel is Setup103Model{
            
            let m = aModel as! Setup103Model
            self.label.text = m.name
            
            tap.v_tap {
                m.v_identifier = 0
                m.v_to()
            }
        }
    }
}
class Setup103Model:VueData{
    
    var name:String?
    convenience init(_ a:String){
        self.init()
        name = a
    }
    override func v_height() -> CGFloat {
        
        return 50
    }
}
