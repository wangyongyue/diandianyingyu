//
//  Main.swift
//  Demo
//
//  Created by apple on 2019/12/12.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class Main:Vue,V_ViewControllerProtocol{
    private var http = MainHttp()
    var array = [VueData]()

    func v_viewController() -> UIViewController{
        let vc = TableViewController()
        vc.m = self
        return vc
    }
    
    override func v_start() {
                
        dealNav()
        dealContent()
        
        self.v_if(vId: STATUSID) { () -> Bool? in
            return true
        }
      
    }
    private func dealNav(){
        
        var array = [VueData]()
        let m = NavTitleCellModel()
        m.name = "点点英语"
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
                       
              
        self.array = self.http.getArray()
         

         self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
             return self.array
                    
         }
                
                  
        }
        
         self.v_index(vId: INDEXID) { (index) in
            if index == 0{return}
            let a = self.array[index] as! MTitleModel
            if let b = a.type{
                Router.push(MainDetails(), ["id":b], nil)
            }
             
        }
        
    }
  
   
   
    
}
