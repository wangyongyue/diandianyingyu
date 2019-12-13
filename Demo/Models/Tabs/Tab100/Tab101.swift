//
//  Tab101.swift
//  Demo
//
//  Created by apple on 2019/12/11.
//  Copyright © 2019 test. All rights reserved.
//


import UIKit
import VueSwift
class Tab101:Vue,GetViewProtocol{
    
    private var http = DefaultHttp()
    func getView() -> ViewLoadProtocol {
        let v = TableView.init(self)
        return v
    }
    
    override func v_start() {
                
        dealContent()
      
    }
   
    private func dealContent(){
        
       POST().request(params: self.http) { (isK, data) in
                       
              
         var array = [VueData]()
         array.append(Content101Model())
         array.append(Content102Model())
         array.append(Content103Model())
         

         self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
             return array
                    
         }
                  
        }
        
         self.v_index(vId: INDEXID) { (index) in
             
            Router.push(TabDetails(), nil, nil)

        }
        
    }
    
    
    
}
