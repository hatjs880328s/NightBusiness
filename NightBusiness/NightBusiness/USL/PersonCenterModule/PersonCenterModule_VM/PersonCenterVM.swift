//
//  *******************************************
//  
//  PersonCenterVM.swift
//  NightBusiness
//
//  Created by Noah_Shan on 2020/7/1.
//  Copyright © 2018 Inpur. All rights reserved.
//  
//  *******************************************
//


import Foundation

public class PersonCenterVM: NSObject {

    /// DATA
    var dataSource: [[(String, String)]] = [] {
        didSet {
            self.reloadAction?(dataSource.count == 0)
        }
    }

    /// DATA RELOAD ACTION
    var reloadAction: ( (_ zerocount: Bool) -> Void)?

    override init() {
        super.init()

        dataSource = [
           [("", ""),
            ("", ""),
            ("面对面", "mainpage_normal_face2face"),
            ("攻略", "mainpage_normal_book")],

           [("绑定(创建)外部团队", "mainpage_normal_share")],

           [("退出", "")]
        ]
    }

    deinit {
        print("PersonCenterVM deinit ...")
    }
}

/// MAKR: - API PROGRESS
extension PersonCenterVM {

}

/// MAKR: - OTHERS PROGRESS
extension PersonCenterVM {

}
