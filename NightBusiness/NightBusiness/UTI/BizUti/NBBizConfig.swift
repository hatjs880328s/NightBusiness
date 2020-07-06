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

    func start() {
//        UITableView().estimatedSectionHeaderHeight = 0
//        UITableView().estimatedSectionFooterHeight = 0

        let dynamic = IIHTTPModuleDynamicParams()
        dynamic.isUrlAction = { _ in
            return true
        }

        IIHTTPModuleDoor.dynamicParams = dynamic
    }
}
