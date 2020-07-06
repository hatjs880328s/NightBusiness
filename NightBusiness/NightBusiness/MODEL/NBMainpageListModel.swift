//
//  *******************************************
//  
//  NBMainpageListModel.swift
//  NightBusiness
//
//  Created by Noah_Shan on 2020/7/6.
//  Copyright © 2018 Inpur. All rights reserved.
//  
//  *******************************************
//


import UIKit
import HandyJSON

class NBMainpageListItemModel: NSObject, HandyJSON {

    var region: String = ""

    var name: String = ""

    var longitude: String = ""

    var latitude: String = ""

    var lat: String = ""

    var address: String = ""

    var distance: String = ""

    var localdistance: String = ""

    var lng: String = ""

    required override init() {
        super.init()
    }

}

class NBMainpageListModel: NSObject, HandyJSON {

    var code: String = ""

    var data: [NBMainpageListItemModel] = []

    var message: String = ""

    required override init() {
        super.init()
    }
}
