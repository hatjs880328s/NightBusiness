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

    var progressCompleteMapAction: (() -> Void)?

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
        //self.map.setMapStyle(1)
    }

}

/// 点标注处理
extension NBMapVw {

    func addPois(items: [NBMainpageCellVmodel]) {
        for eachItem in items {
            self.addOnePOI(item: eachItem)
        }
    }

    /// 添加一个标注点
    func addOnePOI(item: NBMainpageCellVmodel) {
        let point = QPointAnnotation()
        point.coordinate = CLLocationCoordinate2D(latitude: item.lat, longitude: item.lng)
        point.title = "\(item.title)(\(item.distance))"
        point.subtitle = item.subtitle
        self.map.addAnnotation(point)
    }
}

/// map delgate
extension NBMapVw: QMapViewDelegate {

    func mapView(_ mapView: QMapView!, didUpdate userLocation: QUserLocation!, fromHeading: Bool) {
        //print(userLocation)
    }

    /// 地图初始化完成 添加标注
    func mapViewInitComplete(_ mapView: QMapView!) {
        self.progressCompleteMapAction?()
    }

    func mapView(_ mapView: QMapView!, viewFor annotation: QAnnotation!) -> QAnnotationView! {
        if annotation.isKind(of: QPointAnnotation.self) {
            let id = "pointAnnotationid"
            var vi = self.map.dequeueReusableAnnotationView(withIdentifier: id) as? QPinAnnotationView
            if vi == nil {
                vi = QPinAnnotationView(annotation: annotation, reuseIdentifier: id)
                vi?.canShowCallout = true
            }
            vi?.image = UIImage(named: "mainpage_firstcell_hot")
            return vi
        }

        return nil
    }
}
