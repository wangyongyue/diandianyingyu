
//
//  Sentence.swift
//  Demo
//
//  Created by apple on 2019/12/13.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class Sentence{
    var type:String = "File1"
    private var array = [String]()
    private var next = 0
    private func getDic()->[String:String] {
        
        let typeStr = Router.v_params()?["id"] as! String
        
        let diaryList:String = Bundle.main.path(forResource: typeStr, ofType:"plist")!
        let dic = NSDictionary.init(contentsOfFile: diaryList)
        let diaries:[String:String] = dic as! [String:String]
        return diaries
    }
    func getString()->(en:String,ch:String){
        if array.count ==  0{
           
            let dic = getDic()
            for (key,value) in dic{
                array.append(key + "/" + value)
            }
        }
        if array.count ==  0{return ("","") }
        let str = array[next]
        let strs = str.components(separatedBy: "/")
        if let a = strs.first, let b = strs.last{
            return (a,b)
        }
        return ("","")
    }
    func isNext() -> Bool{
        if next >= array.count - 1{
            return false
        }
        next += 1
        return true
    }
    static func randamArray(_ str:String) -> [String] {

        var list = str.components(separatedBy: " ")
        for index in 0..<list.count {

            let newIndex = Int(arc4random_uniform(UInt32(list.count-index))) + index

            if index != newIndex {

                let a = list[index]
                list[index] = list[newIndex]
                list[newIndex] = a
            }

        }
        Debug.log(list)
        return list


    }
    
    
    
}

