//
//  MWord.swift
//  Demo
//
//  Created by apple on 2019/12/12.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class MWord: UITableViewCell {
    
    lazy private var nameLabel:UILabel = {
        let a = UILabel()
        a.textAlignment = .left
        a.font = UIFont.systemFont(ofSize: 16)
        a.text = ""
        a.numberOfLines = 0
        return a
    }()
   
    lazy private var line:UIView = {
        let a = UIView()
        a.backgroundColor = lineColor
        return a
    }()
    lazy private var tap:UITapGestureRecognizer = {
        let a = UITapGestureRecognizer()
        return a
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear

        self.contentView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.line)
       
        self.nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(12)
            make.left.equalTo(12)
            make.right.equalTo(-12)
            make.bottom.equalTo(-12)

        }
       
        self.line.snp.makeConstraints { (make) in
            
            make.height.equalTo(6)
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
        if aModel is MWordModel{
            let m = aModel as! MWordModel
            nameLabel.text = m.name
            tap.v_tap {
                m.v_identifier = 0
                m.v_to()
            }
        }
    }
}
class MWordModel:VueData{
    
    var name:String?
    var enStr:String?
    convenience init(_ a:String){
        self.init()
        name = a
    }
    convenience init(_ a:String,_ b:String){
        self.init()
        name = a
        enStr = b
    }
    override func v_height() -> CGFloat {
        
        return 80
    }
}
