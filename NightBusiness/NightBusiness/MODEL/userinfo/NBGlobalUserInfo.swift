//
//  *******************************************
//  
//  NBGlobalUserInfo.swift
//  NightBusiness
//
//  Created by Noah_Shan on 2020/7/7.
//  Copyright © 2018 Inpur. All rights reserved.
//  
//  *******************************************
//


import UIKit

/// 用户信息
class NBGlobalUserInfo: NSObject {

    @objc var userid: String = NSUUID().uuidString

    @objc var username: String = ""

    @objc var userlocationLaititude: Double = 0

    @objc var userlocationLongitude: Double = 0

    @objc var userCity: String = ""

    @objc var localkey: String = "NBGlobalUserInfokey"

    override init() {
        super.init()
    }

    /// 存储到本地
    func save2Local() {
        IICacheManager.getInstance().saveObj(key: self.localkey, someThing: (self.mj_JSONString()) as NSString)
    }

    /// 本地存储的jsonstr 转为对象
    func getLocalItem() -> NBGlobalUserInfo? {
        let strInfo = IICacheManager.getInstance().getObj(with: self.localkey) as? NSString
        let userinfo = NBGlobalUserInfo.mj_object(withKeyValues: strInfo)
        return userinfo
    }


}

/// 用户管理类
class NBGlobalUserManager: NSObject {

    private static var instance: NBGlobalUserManager!

    private override init() {
        super.init()
    }

    public static func getInstance() -> NBGlobalUserManager {
        if instance == nil {
            instance = NBGlobalUserManager()
        }

        return instance
    }

    private var userInfo: NBGlobalUserInfo!

    /// 获取用户信息-local没有就新建一个
    func getUserInfo() -> NBGlobalUserInfo {
        if userInfo == nil {
            guard let user = NBGlobalUserInfo().getLocalItem() else {
                userInfo = NBGlobalUserInfo()
                return self.userInfo
            }
            self.userInfo = user
            return self.userInfo
        }
        return userInfo!
    }
}
