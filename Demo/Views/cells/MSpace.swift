//
//  MSpace.swift
//  Demo
//
//  Created by apple on 2019/12/12.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class MSpace: UITableViewCell {
    
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
       self.backgroundColor = UIColor.clear

    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setV_Model(_ aModel: VueData) {
       
    }
}
class MSpaceModel:VueData{
    
    var name:String?
    
    override func v_height() -> CGFloat {
        
        return 50
    }
}
