//
//  MBlanks.swift
//  Demo
//
//  Created by apple on 2019/12/12.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class MBlanks: UITableViewCell {
    
    lazy private var m:Vue = {
        let a = Vue()
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

        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: Adapter.width()/4, height: 30)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let table = CCollection.init(frame: CGRect.zero, collectionViewLayout: layout)
        self.addSubview(table)
        table.backgroundColor = UIColor.clear
        table.snp.makeConstraints { (make) in
            
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(-0.3)

        }
        table.v_array(vId: ARRAYID, vue: m)
        table.v_index(vId: INDEXID, vue: m)

        
        self.contentView.addSubview(self.line)

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
        if aModel is MBlanksModel{
            let m = aModel as! MBlanksModel

            self.m.v_array(vId: ARRAYID) { () -> Array<VueData>? in
                return m.array
            }
            self.m.v_index(vId: INDEXID) { (index) in
                
                m.v_identifier = index
                m.v_to()
            }

           
        }
    }
}
class MBlanksModel:VueData{
    
    var name:String?
    var array:[VueData]?
    convenience init(_ arr:[VueData]?){
        self.init()
        array = arr
    }
    override func v_height() -> CGFloat {
        
        return 130
    }
}

