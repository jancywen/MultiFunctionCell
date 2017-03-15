//
//  ObjNodeInfo.swift
//  ArteriovenousLien
//
//  Created by wangwenjie on 2017/3/8.
//  Copyright © 2017年 Roo. All rights reserved.
//

import UIKit
import EVReflection

class ObjNodeInfo: EVObject {
    
    var superiorNode:String?  	//  上级节点ID
    var superiorNodeName:String?  	// 上级节点
    var nodeIdName:String?  	// 节点name
    var groupingValue:String?  	//节点分组ID
    var nodeUpdateTime:String?  	//更新时间
    var isN:String?  	//是否换行
    var id_i:String?  	//id编码
    var orderdesc:String?  	//排序
    var nodeName:String?  	//中文名称
    var nodeType:String?  	//节点类型 1,显示值 2,文本值 3,选中值
    var valueType:String?  	// 转出医院:{}{}
    var value:String?  	// XXX医院 &  XXX医院
    var is_model:String?  	//是否模版
    var trade_code:String?  	//转运编码
    
}
