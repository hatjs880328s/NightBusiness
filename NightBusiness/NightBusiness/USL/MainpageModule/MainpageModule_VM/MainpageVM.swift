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

    var userLocation: TencentLBSLocation!

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
        group.enter()
        var result = [NBMainpageCellVmodel]()
        _ = NBMainpageDAL.getMainpageListData(cityid: "").subscribe(onNext: { element in
            guard let item = [NBMainpageListItemModel].deserialize(from: element) as? [NBMainpageListItemModel] else { return }
            for eachItem in item {
                let realitem = NBMainpageCellVmodel(model: eachItem)
                realitem.hotCount = Double(arc4random() % 10)
                realitem.distance = "\(arc4random() % 80)km"
                result.append(realitem)
            }
            group.leave()
        })

        group.enter()
        NBQMap.getInstance().updateLocationAction = { location  in
            self.userLocation = location
            group.leave()
        }
        NBQMap.getInstance().startSingleLocation()

        group.notify(queue: DispatchQueue.global(qos: DispatchQoS.QoSClass.userInteractive)) {
            // 定位完毕，数据请求完毕才会执行此处代码
        }
    }

    func sortItems() {
        
    }
}

/// MAKR: - OTHERS PROGRESS
extension MainpageVM {

}
