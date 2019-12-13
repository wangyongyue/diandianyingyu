//
//  MSelectSub.swift
//  Demo
//
//  Created by apple on 2019/12/12.
//  Copyright © 2019 test. All rights reserved.
//


import UIKit
import VueSwift
class MSelectSub: UICollectionViewCell {
    
    lazy private var nameLabel:UILabel = {
         let a = UILabel()
         a.textAlignment = .center
         a.font = UIFont.systemFont(ofSize: 15)
         a.text = ""
         a.numberOfLines = 0
         
         return a
     }()
    
    lazy private var bgView:UIView = {
        let a = UIView()
        a.backgroundColor = UIColor.white
        a.layer.cornerRadius = 6
        a.layer.masksToBounds = true
        a.layer.borderColor = UIColor.lightGray.cgColor
        a.layer.borderWidth = 0.3
        return a
    }()
    
    
     lazy private var tap:UITapGestureRecognizer = {
         let a = UITapGestureRecognizer()
         return a
     }()
     override init(frame: CGRect) {
     super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        
       
        
        
         self.contentView.addSubview(self.bgView)
         self.bgView.addSubview(self.nameLabel)
        
         self.bgView.snp.makeConstraints { (make) in
            
            make.top.equalTo(6)
            make.left.equalTo(3)
            make.bottom.equalTo(-1)
            make.right.equalTo(-2)
            
          }
         self.nameLabel.snp.makeConstraints { (make) in
             
             make.top.equalTo(0)
             make.left.equalTo(0)
             make.bottom.equalTo(0)
             make.right.equalTo(0)
             
         }
        
         self.contentView.addGestureRecognizer(tap)
     }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setV_Model(_ aModel: VueData) {
        if aModel is MSelectSubModel{
            let m = aModel as! MSelectSubModel
            nameLabel.text = m.name

            tap.v_tap {
                m.v_identifier = 0
                m.v_to()
            }
        }
    }
}
class MSelectSubModel:VueData{
    
    var name:String?
    convenience init(_ a:String){
        self.init()
        name = a
    }
    
    override func v_height() -> CGFloat {
        
        return 120
    }
}


