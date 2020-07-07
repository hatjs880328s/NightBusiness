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
        _ = NBMainpageDAL.getMainpageListData(cityid: "").subscribe(onNext: { element in
            guard let item = [NBMainpageListItemModel].deserialize(from: element) as? [NBMainpageListItemModel] else { return }

            var result = [NBMainpageCellVmodel]()
            for eachItem in item {
                let realitem = NBMainpageCellVmodel(model: eachItem)
                realitem.hotCount = Double(arc4random() % 10)
                //realitem.imgs = ["mainpage_normal_share", "mainpage_normal_share", "mainpage_normal_share"]
                result.append(realitem)
            }

            self.dataSource = result
        })
    }
}

/// MAKR: - OTHERS PROGRESS
extension MainpageVM {

}
