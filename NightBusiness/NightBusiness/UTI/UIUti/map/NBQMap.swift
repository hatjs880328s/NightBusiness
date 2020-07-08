//
//  *******************************************
//  
//  NBQMap.swift
//  NightBusiness
//
//  Created by Noah_Shan on 2020/7/7.
//  Copyright © 2018 Inpur. All rights reserved.
//  
//  *******************************************
//


import UIKit
import Foundation

class NBQMap: NSObject {

    private override init() {
        super.init()
    }

    private static var instance: NBQMap!

    public static func getInstance() -> NBQMap {
        if instance == nil {
            instance = NBQMap()
            instance.configManager()
        }

        return instance
    }

    var manager: TencentLBSLocationManager = TencentLBSLocationManager()

    var searchManager: QMSSearcher!

    /// 位置更新回调
    var updateLocationAction: ((_ location: TencentLBSLocation?) -> Void)?

    /// 逆地理位置回调
    var locationGeoAction: ((_ add: QMSReverseGeoCodeSearchResult) -> Void)?

    /// 启动配置
    private func configManager() {
        manager.delegate = NBQMap.instance
        manager.apiKey = NBBizConfig.mapKey
        manager.requestLevel = .name
        let auth = CLLocationManager.authorizationStatus()
        if auth == .notDetermined {
            manager.requestWhenInUseAuthorization()
        }

        self.searchManager = QMSSearcher()
        self.searchManager.delegate = self
    }
}

extension NBQMap: TencentLBSLocationManagerDelegate {

    /// 单次定位
    func startSingleLocation() {
        self.manager.requestLocation(with: TencentLBSRequestLevel.geo, locationTimeout: 10) { (location, err) in
            if err == nil {
                self.updateLocationAction?(location)
            }
        }
    }

    /// 连续定位
    func startSerialLocation() {
        self.manager.startUpdatingLocation()
    }

    /// 位置更新
    func tencentLBSLocationManager(_ manager: TencentLBSLocationManager, didUpdate location: TencentLBSLocation) {
        self.updateLocationAction?(location)
    }

    /// 定位有问题
    func tencentLBSLocationManager(_ manager: TencentLBSLocationManager, didFailWithError error: Error) {
        let status = CLLocationManager.authorizationStatus()
        if status == .denied || status == .restricted {
            //定位权限没开启
            let con = UIAlertController(title: "提示", message: "您的定位权限未开始，是否开启权限以便我们推荐给您更好的地摊信息?", preferredStyle: UIAlertController.Style.alert)

            let goaction = UIAlertAction(title: "开启", style: UIAlertAction.Style.default) { (_) in
                guard let itemurl = URL(string: UIApplication.openSettingsURLString) else { return }
                if UIApplication.shared.canOpenURL(itemurl) {
                    UIApplication.shared.openURL(itemurl)
                }
            }

            let cancelaction = UIAlertAction(title: "取消", style: UIAlertAction.Style.default) { (_) in

            }
            con.addAction(goaction)
            con.addAction(cancelaction)

            IIAppExtension().topViewController()?.present(con, animated: true, completion: nil)
        } else {
            // unkonwn err
        }

    }
}

/// 距离计算
extension NBQMap {

    /// 计算两点之间的距离
    func calculateTwopointsDistance(fis: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Double {
        let dis = QMetersBetweenCoordinates(fis, rhs)
        return dis
    }
}

/// 逆地址解析 location -> address
extension NBQMap: QMSSearchDelegate {

    /// 发起逆地理位置处理
    func changeLocation2Address(location: CLLocationCoordinate2D) {
        let options = QMSReverseGeoCodeSearchOption()
        options.setLocationWithCenter(location)
        options.get_poi = true
        options.poi_options = "page_size=5;page_index=1"
        self.searchManager.search(with: options)


        let opt = QMSGeoCodeSearchOption()
        opt.address = "北京市海淀区彩和坊路海淀西大街74号"
        opt.region = "北京"
        self.searchManager.search(with: opt)

        NBMAPGeoUti().getGeo(location: location).subscribe(onNext: {
            print($0)
        })
    }

    /// 回调函数
    func search(with reverseGeoCodeSearchOption: QMSReverseGeoCodeSearchOption, didReceive reverseGeoCodeSearchResult: QMSReverseGeoCodeSearchResult) {
        let result = reverseGeoCodeSearchResult
        print(result)
        locationGeoAction?(result)
    }

    func search(with geoCodeSearchOption: QMSGeoCodeSearchOption, didReceive geoCodeSearchResult: QMSGeoCodeSearchResult) {
        print("fdsa")
    }

    func search(with poiSearchOption: QMSPoiSearchOption, didReceive poiSearchResult: QMSPoiSearchResult) {
        print("fdasfas")
    }

    func search(with searchOption: QMSSearchOption, didFailWithError error: Error) {
        print("逆地理出错了")
    }
}

