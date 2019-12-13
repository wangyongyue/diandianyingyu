//
//  MPunctuation.swift
//  Demo
//
//  Created by apple on 2019/12/12.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class MPunctuation: UICollectionViewCell {
    
    lazy private var nameLabel:UILabel = {
         let a = UILabel()
         a.textAlignment = .center
         a.font = UIFont.systemFont(ofSize: 15)
         a.text = ""
         a.numberOfLines = 0
         return a
     }()
    
    
     lazy private var tap:UITapGestureRecognizer = {
         let a = UITapGestureRecognizer()
         return a
     }()
     override init(frame: CGRect) {
     super.init(frame: frame)
         
         self.backgroundColor = UIColor.clear
         self.contentView.addSubview(self.nameLabel)
        
         self.nameLabel.snp.makeConstraints { (make) in
             
             make.top.equalTo(2)
             make.left.equalTo(2)
             make.bottom.equalTo(-2)
             make.right.equalTo(-2)
             
         }
        
         self.contentView.addGestureRecognizer(tap)
     }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setV_Model(_ aModel: VueData) {
        if aModel is MPunctuationModel{
            let m = aModel as! MPunctuationModel
            nameLabel.text = m.name

            tap.v_tap {
                m.v_identifier = 0
                m.v_to()
            }
        }
    }
}
class MPunctuationModel:VueData{
    
    var name:String?
    convenience init(_ a:String){
        self.init()
        name = a
    }
    
    override func v_height() -> CGFloat {
        
        return 120
    }
}

