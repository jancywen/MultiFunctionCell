//
//  ObjALInfo.swift
//  ArteriovenousLien
//
//  Created by wangwenjie on 2017/3/10.
//  Copyright © 2017年 Roo. All rights reserved.
//

import UIKit
import EVReflection

class ObjALInfo: EVObject {

    
    var alType:String?              //类型
    var Paracentesis: String?       //穿刺位置
    var date:String?                //日期
    var mark:String?                //型号
    var insideLength:String?        //置入长度
    var armGirth: String?           //臂围
    var leakageLength:String?       //外露长度
    var otherSupplement:String?     //其他补充
    var skin:String?                //周围皮肤
    var unusual:String?             //异常情况
    
    @objc dynamic var cellHeight: Float {
        get{
            var c_h:Float = 0.0
            switch alType! {
            case "外周静脉","动脉":
                c_h = 200.0
            case "中心静脉","脐静脉":
                c_h = 260.0
            case "PICC":
                c_h = 290.0
            case "输液港":
                c_h = 230.0
            default:
                c_h = 280.0
            }
            
            if skin != nil {
                if skin == "异常" {
                    c_h += 30.0
                }
            }
            return c_h
        }
        set {
            
        }
    }

}
