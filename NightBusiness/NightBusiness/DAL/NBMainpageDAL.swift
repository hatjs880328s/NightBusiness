//
//  *******************************************
//  
//  NBMainpageDAL.swift
//  NightBusiness
//
//  Created by Noah_Shan on 2020/7/6.
//  Copyright © 2018 Inpur. All rights reserved.
//  
//  *******************************************
//


import UIKit
import RxSwift
import IIHTTPRequest

/// 首页数据dal
class NBMainpageDAL: NSObject {

    /// 首页列表数据
    static func getMainpageListData(cityid: String) -> Observable<NSArray?> {
        let params = [
            "longitude": "",
            "latitude": "",
            "lng": "117.127449",
            "lat": "36.660931",
            "region": "",
            "star": ""
        ]
        return Observable<NSArray?>.create { (observer) -> Disposable in
            IIHTTPRequest.startRequest(method: IIHTTPMethod.post, url: NBAPIUti.mainpagelistAPI, params: params, successAction: { (res) in
                observer.onNext(res.arrValue)
                observer.onCompleted()
            }) { (_) in
                observer.onNext(nil)
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
}
