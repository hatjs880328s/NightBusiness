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
    var dataSource: [NSObject] = [] {
        didSet {
            self.reloadAction?(dataSource.count == 0)
        }
    }

    /// DATA RELOAD ACTION
    var reloadAction: ( (_ zerocount: Bool) -> Void)?

    override init() {
        super.init()
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
