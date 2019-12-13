//
//  TabDetails.swift
//  Demo
//
//  Created by apple on 2019/12/11.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class TabDetails:Vue,V_ViewControllerProtocol{
    private var http = DefaultHttp()
    
    func v_viewController() -> UIViewController{
        let vc = TableViewController()
        vc.m = self
        return vc
    }
    
    override func v_start() {
                
        dealNav()
        dealContent()
      
    }
    private func dealNav(){
        
        var array = [VueData]()
        let m = NavBackCellModel()
        m.name = "详情"
        array.append(m)
        self.v_array(vId: NAVARRAYID) { () -> Array<VueData>? in
            return array
        }
        self.v_index(vId: NAVINDEXID) { (index) in
            
        }
        
    }
    private func dealContent(){
        
       POST().request(params: self.http) { (isK, data) in
              
        var array = [VueData]()
        array.append(Content301Model())
        array.append(Content302Model())
        array.append(Content303Model())

         self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
             return array
         }
                  
        }

        self.v_index(vId: INDEXID) { (index) in
             
        }
        
    }
  
   
   
    
}
