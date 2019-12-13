//
//  Tab102.swift
//  Demo
//
//  Created by wangyongyue on 2019/12/10.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class Tab200:Vue,V_ViewControllerProtocol{
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
        let m = Nav102Model()
        m.name = "tab2"
        array.append(m)
        self.v_array(vId: NAVARRAYID) { () -> Array<VueData>? in
            return array
        }
        self.v_index(vId: NAVINDEXID) { (index) in
            if m.v_identifier == 0{
                Router.push(TabDetails(), nil, nil)

            }
        }
        
    }
    private func dealContent(){
        
       POST().request(params: self.http) { (isK, data) in
                       
              
         var array = [VueData]()
         array.append(Content201Model())
         array.append(Content202Model())
         array.append(Content203Model())

         self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
             return array
                    
         }
                
                  
        }
        
         self.v_index(vId: INDEXID) { (index) in
            
            Router.push(TabDetails(), nil, nil)
             
        }
        
    }
  
   
   
    
}
