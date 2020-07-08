//
//  *******************************************
//  
//  MainpageVM.swift
//  NightBusiness
//
//  Created by Noah_Shan on 2020/7/3.
//  Copyright © 2018 Inpur. All rights reserved.
//  
//  *******************************************
//


import Foundation

public class MainpageVM: NSObject {

    /// DATA
    var dataSource: [NBMainpageCellVmodel] = [] {
        didSet {
            self.reloadAction?(dataSource.count == 0)
        }
    }

    /// DATA RELOAD ACTION
    var reloadAction: ( (_ zerocount: Bool) -> Void)?

    var dal: NBMainpageDAL = NBMainpageDAL()

    override init() {
        super.init()
    }

    deinit {
        print("MainpageVM deinit ...")
    }
}

/// MAKR: - API PROGRESS
extension MainpageVM {

    func getListData() {
        let group = DispatchGroup()
        /// 获取列表数据
        group.enter()
        var result = [NBMainpageCellVmodel]()
        _ = NBMainpageDAL.getMainpageListData(cityid: "").subscribe(onNext: { element in
            guard let item = [NBMainpageListItemModel].deserialize(from: element) as? [NBMainpageListItemModel] else { return }
            for eachItem in item {
                let realitem = NBMainpageCellVmodel(model: eachItem)
                realitem.hotCount = Double(arc4random() % 10)
                result.append(realitem)
            }
            group.leave()
        })

        /// 获取地理位置信息
        group.enter()
        NBQMap.getInstance().updateLocationAction = { location  in
            NBGlobalUserManager.getInstance().getUserInfo().userlocationLaititude = location?.location.coordinate.latitude ?? 0
            NBGlobalUserManager.getInstance().getUserInfo().userlocationLongitude = location?.location.coordinate.longitude ?? 0
            group.leave()
        }
        NBQMap.getInstance().startSingleLocation()

        /// 处理结果
        group.notify(queue: DispatchQueue.global(qos: DispatchQoS.QoSClass.userInteractive)) {
            // 定位完毕，数据请求完毕才会执行此处代码
            // 1.计算每一个vmodel距离当前用户的距离
            for eachitem in result {
                eachitem.calculateDistance()
            }
            // 2.给他们排序
            result = self.sortItems(items: result)
            // 3.显示
            GCDUtils.toMianThreadProgressSome {
                self.dataSource = result
            }
            // 4.逆地理处理
            NBQMap.getInstance().locationGeoAction = { result in
                print(result)
            }
            NBQMap.getInstance().changeLocation2Address(location: CLLocationCoordinate2D(latitude: NBGlobalUserManager.getInstance().getUserInfo().userlocationLaititude, longitude: NBGlobalUserManager.getInstance().getUserInfo().userlocationLongitude))
        }
    }

    /// 按照距离排序
    func sortItems(items: [NBMainpageCellVmodel]) -> [NBMainpageCellVmodel] {
        return IIMergeSort.sort(array: items)
    }
}

/// MAKR: - OTHERS PROGRESS
extension MainpageVM {

}
