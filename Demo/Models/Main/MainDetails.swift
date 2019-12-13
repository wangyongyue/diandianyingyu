//
//  MainDetails.swift
//  Demo
//
//  Created by apple on 2019/12/12.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class MainDetails:Vue,V_ViewControllerProtocol{
    private var http = DetailsHttp()
    var array = [VueData]()
    var arrayEn = [VueData]()
    var arraySe = [VueData]()

    
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
        m.name = ""
        array.append(m)
        self.v_array(vId: NAVARRAYID) { () -> Array<VueData>? in
            return array
        }
        self.v_index(vId: NAVINDEXID) { (index) in
            
        }
        
    }
    private func isSuccess() -> Bool{
        let a1 = self.array[1] as! MWordModel
        let chStr = a1.enStr
        var enStr = "";
        for (index,value) in self.arrayEn.enumerated() {
            if value is MBlanksSubModel{
                let b = value as! MBlanksSubModel
                if let n = b.name{
                    if enStr.count == 0{
                        enStr =  n

                    }else{
                        enStr = enStr + " " + n

                    }
                }
                
            }else if value is MPunctuationModel{
                let b = value as! MPunctuationModel
                if let n = b.name{
                    if enStr.count == 0{
                        enStr =  n

                    }else{
                        enStr = enStr + " " + n

                    }
                }
            }
        }
        if !enStr.contains("--"){
            
            if chStr == enStr{
                return true
            }else{
//                Alert.show(str: "请更改")
                return false
            }
            
        }
       
        return false
    }
    private func dealContent(){
        
       POST().request(params: self.http) { (isK, data) in
              
        self.array = self.http.getArray()
        let mEn = self.array[2] as! MBlanksModel
        let mSe = self.array[3] as! MSelectModel

        if let a = mEn.array,let b = mSe.array{
            self.arrayEn = a
            self.arraySe = b
        }

         self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
             return self.array
         }
                  
        }

        self.v_index(vId: INDEXID) { (index) in
            let data = self.array[index]
            let number = data.v_identifier
            if index == 2{
                let b = self.arrayEn[number]
                if b is MBlanksSubModel{
                    let c = b as! MBlanksSubModel
                    c.name = "--"
                    self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
                        return self.array
                    }
                }
               
                
            }else if index == 3{
                
                let a = self.arraySe[number] as! MSelectSubModel
                for value in self.arrayEn{
                    if value is MBlanksSubModel{
                        let b = value as! MBlanksSubModel
                        if b.name == "--"{
                            b.name = a.name
                            self.v_array(vId: ARRAYID) { () -> Array<VueData>? in
                                return self.array
                            }
                            if self.isSuccess(){
                                
                                Alert.success {
                                    self.array.removeAll()
                                    self.arrayEn.removeAll()
                                    self.arraySe.removeAll()
                                    if self.http.sent.isNext(){
                                        self.dealContent()
                                    }else{
                                        Alert.show(str: "恭喜，完成挑战")
                                        Router.pop(nil)
                                    }
                                    
                                 }
                                
                            }
                           
                            
                            return
                        }
                        
                    }
                }
                
            }
             
        }
        
    }
  
   
   
    
}
