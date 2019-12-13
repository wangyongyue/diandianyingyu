//
//  Tab103.swift
//  Demo
//
//  Created by wangyongyue on 2019/12/10.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class Tab300:Vue,V_ViewControllerProtocol{
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
        let m = Nav103Model()
        m.name = "tab3"
        array.append(m)
        self.v_array(vId: NAVARRAYID) { () -> Array<VueData>? in
            return array
        }
        self.v_index(vId: NAVINDEXID) { (index) in
            
            if m.v_identifier == 0{
                Router.push(TabDetails(), nil, nil)

            }else if m.v_identifier == 1{
                Router.push(TabDetails(), nil, nil)

            }
            
        }
        
    }
    private func dealContent(){
        
       POST().request(params: self.http) { (isK, data) in
              
        
        var array = [VueData]()
        array.append(Setup101Model())
        array.append(Setup103Model("账号设置"))
        array.append(Setup103Model("其他设置"))
        array.append(Setup102Model("退出登录"))

         self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
             return array
         }
                  
        }

        self.v_index(vId: INDEXID) { (index) in
             
            if index == 3{
                UIViewController.toLogin()
            }else{
                Router.push(TabDetails(), nil, nil)

            }
        }
        
    }
  
   
   
    
}
