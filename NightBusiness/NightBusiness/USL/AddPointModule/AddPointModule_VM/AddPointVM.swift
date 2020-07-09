//
//  *******************************************
//  
//  AddPointVM.swift
//  NightBusiness
//
//  Created by Noah_Shan on 2020/7/8.
//  Copyright © 2018 Inpur. All rights reserved.
//  
//  *******************************************
//


import Foundation

public class AddPointVM: NSObject {

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
        print("AddPointVM deinit ...")
    }
}

/// MAKR: - API PROGRESS
extension AddPointVM {

}

/// MAKR: - OTHERS PROGRESS
extension AddPointVM {

}
