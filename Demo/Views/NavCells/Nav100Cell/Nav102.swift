//
//  Nav102.swift
//  Demo
//
//  Created by apple on 2019/12/11.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class Nav102: UITableViewCell {
    
    let headerLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = Configuration.instructions.navigtaionTextColor()
        label.backgroundColor = UIColor.clear
        return label
    }()
    
    lazy private var rightButton:UIButton = {
        let a = UIButton()
        a.setImage(UIImage.init(named: "search"), for: .normal)

        return a
    }()
    
    
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear


        self.contentView.addSubview(rightButton)
        self.contentView.addSubview(headerLabel)

        
        headerLabel.snp.makeConstraints { (make) in
            
            make.center.equalTo(self.contentView)
        }
       
        rightButton.snp.makeConstraints { (make) in
            
            make.centerY.equalTo(self.contentView)
            make.right.equalTo(-15)
        }
       
           
    
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setV_Model(_ aModel: VueData) {
        if aModel is Nav102Model{
            let m = aModel as! Nav102Model
        
            headerLabel.text = m.name
            rightButton.v_click {
                m.v_identifier = 0
                m.v_to()
            }
           
        }
    }
    
}
class Nav102Model:VueData{
    
    var name:String?
    override func v_height() -> CGFloat {

        return 40
    }
  
}

