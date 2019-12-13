

//
//  MainHttp.swift
//  Demo
//
//  Created by apple on 2019/12/13.
//  Copyright © 2019 test. All rights reserved.
//


import UIKit
import VueSwift
class MainHttp: HttpProtocol{
    
    var url:String = defaultUrl
    var userId:Int?
    var token:String?
    func getPOSTBody() -> [String:Any]{
        var body = [String:Any]()
        body["userId"] = userId
        body["token"] = token
        return body
    }
    func getArray() -> [VueData]{
        
        var array = [VueData]()
        array.append(MTextModel())
        array.append(MTitleModel("挑战一阶","File1"))
        array.append(MTitleModel("挑战二阶","File2"))
        array.append(MTitleModel("挑战三阶","File3"))
        array.append(MTitleModel("挑战四阶","File4"))
//        array.append(MTitleModel("neirong","File5"))

        
        return array
    }
    
   
    
}

