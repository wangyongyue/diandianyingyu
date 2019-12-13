//
//  Nav103.swift
//  Demo
//
//  Created by apple on 2019/12/11.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class Nav103: UITableViewCell {
    
    let headerLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = Configuration.instructions.navigtaionTextColor()
        label.backgroundColor = UIColor.clear
        return label
    }()
    
   
    lazy private var rightButton:UIButton = {
        let a = UIButton()
        a.setImage(UIImage.init(named: "r_1"), for: .normal)

        return a
    }()
    lazy private var leftButton:UIButton = {
        let a = UIButton()
        a.setImage(UIImage.init(named: "r_2"), for: .normal)

        return a
    }()
    
    
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear

        self.contentView.addSubview(leftButton)
        self.contentView.addSubview(headerLabel)
        self.contentView.addSubview(rightButton)

        
        leftButton.snp.makeConstraints { (make) in
            
            make.centerY.equalTo(self.contentView)
            make.left.equalTo(15)
        }
       
        rightButton.snp.makeConstraints { (make) in
            
            make.centerY.equalTo(self.contentView)
            make.right.equalTo(-15)
        }
        headerLabel.snp.makeConstraints { (make) in
               
                        
            make.center.equalTo(self.contentView)

        }
           
    
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setV_Model(_ aModel: VueData) {
        if aModel is Nav103Model{
            let m = aModel as! Nav103Model
            headerLabel.text = m.name
            leftButton.v_click {
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
class Nav103Model:VueData{
    
    var name:String?
    override func v_height() -> CGFloat {

        return 40
    }
  
}

