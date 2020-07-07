//
//  *******************************************
//  
//  NBBizConfig.swift
//  NightBusiness
//
//  Created by Noah_Shan on 2020/7/1.
//  Copyright © 2018 Inpur. All rights reserved.
//  
//  *******************************************
//


import UIKit
import IIHTTPRequest

class NBBizConfig: NSObject {

    let mapKey: String = "KZ2BZ-56WKP-I2BDO-V4DXQ-I2DR2-DVFWC"

    func start() {

        /// http
        let dynamic = IIHTTPModuleDynamicParams()
        dynamic.isUrlAction = { _ in
            return true
        }

        IIHTTPModuleDoor.dynamicParams = dynamic

        /// map
        QMapServices.shared().apiKey = self.mapKey
    }

    private override init() {
        super.init()
    }

    private static var instance: NBBizConfig!

    public static func getInstance() -> NBBizConfig {
        if instance == nil {
            instance = NBBizConfig()
        }

        return instance
    }
}
