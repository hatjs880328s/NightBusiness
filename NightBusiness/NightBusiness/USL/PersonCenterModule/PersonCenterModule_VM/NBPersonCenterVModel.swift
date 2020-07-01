//
//  *******************************************
//  
//  NBPersonCenterVModel.swift
//  NightBusiness
//
//  Created by Noah_Shan on 2020/7/1.
//  Copyright © 2018 Inpur. All rights reserved.
//  
//  *******************************************
//


import UIKit

class NBPersonCenterVModel: NSObject {

}

/// 个人中心第一个cell vmodel
class NBPersonCenterUserVModel: NSObject {

    /// 名字
    var name: String = "Miltion Figueroa"

    /// 组织名称
    var enterprise: String = "云研发中心"

    /// 头像图片
    var icon: String = ""

    /// 右侧的箭头
    var rightArrow: String = "mainpage_arrow"

    /// 设置按钮图片
    var settingImg: String = "mainpage_arrow"

    /// 设置文案
    var settingInfo: String = "设置"
}
