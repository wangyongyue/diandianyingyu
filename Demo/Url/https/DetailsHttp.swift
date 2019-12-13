
//
//  DetailsHttp.swift
//  Demo
//
//  Created by apple on 2019/12/13.
//  Copyright © 2019 test. All rights reserved.
//


import UIKit
import VueSwift
class DetailsHttp: HttpProtocol{
    
    var url:String = defaultUrl
    var userId:Int?
    var token:String?
    var next:Int = 0
    let sent = Sentence()
    func getPOSTBody() -> [String:Any]{
        var body = [String:Any]()
        body["userId"] = userId
        body["token"] = token
        return body
    }
    func getArray() -> [VueData]{
         
         var array = [VueData]()
         var arrayEn = [VueData]()
         var arraySe = [VueData]()
        
         array.append(MSpaceModel())

         let res = sent.getString()
         array.append(MWordModel(res.ch,res.en))
        
        let ens = Sentence.randamArray(res.en)
         for value in ens{
             
             arrayEn.append(MBlanksSubModel("--"))
             arraySe.append(MSelectSubModel(value))
         }
         array.append(MBlanksModel(arrayEn))
         array.append(MSelectModel(arraySe))
         return array
    }
    
    
}



//En： （状语1） 主（定语1） 谓（状语2） （宾）（定语2） （状语1）
//
//Ch： （状语1） （定语1）主 （状语2）谓 （定语2）（宾） （状语1）
