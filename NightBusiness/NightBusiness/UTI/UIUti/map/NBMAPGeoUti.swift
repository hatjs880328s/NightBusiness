//
//  *******************************************
//  
//  NBMAPGeoUti.swift
//  NightBusiness
//
//  Created by Noah_Shan on 2020/7/8.
//  Copyright © 2018 Inpur. All rights reserved.
//  
//  *******************************************
//


import UIKit
import RxSwift

class NBMAPGeoUti: NSObject {


    func getGeo(location: CLLocationCoordinate2D) -> Observable<NBMAPGeoModel?>{
        let url = NBAPIUti.mapGeoApi.replace(find: ":lat", replaceStr: "\(location.latitude)").replace(find: ":lng", replaceStr: "\(location.longitude)").replace(find: ":key", replaceStr: "\(NBBizConfig.mapKey)")
        return Observable<NBMAPGeoModel?>.create { (observer) -> Disposable in
            request(url, method: HTTPMethod.get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (data) in
                let item = NBMAPGeoModel.deserialize(from: data.value as? NSDictionary)
                observer.onNext(item)
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
}


class NBMAPGeoModel: NSObject, HandyJSON {
    var status: Int = 0

    var message: String = ""

    var result: NBMAPGeoDataModel!

    required override init() {
        super.init()
    }
}

class NBMAPGeoDataModel: NSObject, HandyJSON {

    var address: String = ""

    var address_component: NBMAPGeoDataComModel!

    var formatted_addresses: NBMAPGeoDataAdressModel!

    required override init() {
        super.init()
    }
}

class NBMAPGeoDataAdressModel: NSObject, HandyJSON {

    var recommend: String = ""

    var rough: String = ""

    required override init() {
        super.init()
    }
}

class NBMAPGeoDataComModel: NSObject, HandyJSON {

    var nation: String = ""

    var province: String = ""

    var city: String = ""

    var district: String = ""

    var street: String = ""

    var street_number: String = ""

    required override init() {
        super.init()
    }
}


