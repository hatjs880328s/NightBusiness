//
//  *******************************************
//  
//  MapModuleVM.swift
//  NightBusiness
//
//  Created by Noah_Shan on 2020/7/7.
//  Copyright © 2018 Inpur. All rights reserved.
//  
//  *******************************************
//


import Foundation

public class MapModuleVM: NSObject {

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
        print("MapModuleVM deinit ...")
    }
}

/// MAKR: - API PROGRESS
extension MapModuleVM {

}

/// MAKR: - OTHERS PROGRESS
extension MapModuleVM {

}
