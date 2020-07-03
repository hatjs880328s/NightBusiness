//
//  *******************************************
//  
//  MainTabbarVM.swift
//  NightBusiness
//
//  Created by Noah_Shan on 2020/7/3.
//  Copyright © 2018 Inpur. All rights reserved.
//  
//  *******************************************
//


import Foundation

public class MainTabbarVM: NSObject {

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
        print("MainTabbarVM deinit ...")
    }
}

/// MAKR: - API PROGRESS
extension MainTabbarVM {

}

/// MAKR: - OTHERS PROGRESS
extension MainTabbarVM {

}
