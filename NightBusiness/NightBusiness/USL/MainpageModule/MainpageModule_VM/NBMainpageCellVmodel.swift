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
class NBMainpageCellVmodel: NSObject, Comparable {

    var title: String = "HYJG"

    var subtitle: String = "hyjg..."

    var distance: String {
        return "\(distanceValue)km"
    }

    var distanceValue: Double = 0

    /// MAX IS 10
    var hotCount: Double = 9.0

    var imgs: [String] = []

    var lat: Double = 0

    var lng: Double = 0

    var cellHeight : CGFloat {
        if imgs.count == 0 {
            return 97
        }
        return 190
    }

    init(model: NBMainpageListItemModel) {
        self.title = model.name
        self.subtitle = model.address
        self.lat = Double(model.latitude) ?? 0
        self.lng = Double(model.longitude) ?? 0
    }

    /// 计算距离
    func calculateDistance() {
        if NBGlobalUserManager.getInstance().getUserInfo().userlocationLaititude == 0 { return }
        let lhspoint = CLLocationCoordinate2D(latitude: NBGlobalUserManager.getInstance().getUserInfo().userlocationLaititude, longitude: NBGlobalUserManager.getInstance().getUserInfo().userlocationLongitude)

        let rhspoint = CLLocationCoordinate2D(latitude: self.lat, longitude: self.lng)

        self.distanceValue = (NBQMap.getInstance().calculateTwopointsDistance(fis: lhspoint, rhs: rhspoint) / 1000)

        distanceValue = String(format:"%.1f",self.distanceValue).toDouble() ?? 0
    }

    static func < (lhs: NBMainpageCellVmodel, rhs: NBMainpageCellVmodel) -> Bool {
        return lhs.distanceValue < rhs.distanceValue
    }
}
