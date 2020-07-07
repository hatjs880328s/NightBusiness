//
//  *******************************************
//  
//  NBMainpageCellVmodel.swift
//  NightBusiness
//
//  Created by Noah_Shan on 2020/7/3.
//  Copyright © 2018 Inpur. All rights reserved.
//  
//  *******************************************
//


import UIKit

/// vmodel
class NBMainpageCellVmodel: NSObject {

    var title: String = "HYJG"

    var subtitle: String = "hyjg..."

    var distance: String = "30km"

    /// MAX IS 10
    var hotCount: Double = 9.0

    var imgs: [String] = []

    var cellHeight : CGFloat {
        if imgs.count == 0 {
            return 97
        }
        return 190
    }

    init(model: NBMainpageListItemModel) {
        self.title = model.name
        self.subtitle = model.address
    }
}
