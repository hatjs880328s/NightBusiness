//
//  *******************************************
//  
//  NBMapVw.swift
//  NightBusiness
//
//  Created by Noah_Shan on 2020/7/7.
//  Copyright © 2018 Inpur. All rights reserved.
//  
//  *******************************************
//


import UIKit

class NBMapVw: UIView {

    let map: QMapView = QMapView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initVw()
    }

    required init?(coder: NSCoder) {
        fatalError("init self err..")
    }

    func initVw() {
        self.addSubview(self.map)
        self.map.delegate = self
        self.map.snp.makeConstraints { (make) in
            make.left.right.bottom.top.equalTo(0)
        }
        self.map.showsUserLocation = true
        self.map.userTrackingMode = .follow
        self.map.setMapStyle(1)
    }

}

/// map delgate
extension NBMapVw: QMapViewDelegate {

    func mapView(_ mapView: QMapView!, didUpdate userLocation: QUserLocation!, fromHeading: Bool) {
        print(userLocation)
    }
}
