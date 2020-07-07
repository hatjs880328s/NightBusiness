//
//  *******************************************
//  
//  NBMainpagetopVw.swift
//  NightBusiness
//
//  Created by Noah_Shan on 2020/7/3.
//  Copyright © 2018 Inpur. All rights reserved.
//  
//  *******************************************
//


import UIKit

/// 顶部vw
class NBMainpagetopVw: UIView {

    weak var fatherVw: UIView!

    var nameLb: UILabel = UILabel()

    init(frame: CGRect, fatherVw: UIView) {
        super.init(frame: frame)
        self.fatherVw = fatherVw

        self.initVw()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// vw init
    func initVw() {
        self.fatherVw.addSubview(self)

        self.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(0)
            make.height.equalTo(100 + (IHTUIConfig.isIphoneX ? 44 : 20))
        }

        self.backgroundColor = IHTUIConfig.mainThemeColor

        self.nameLb.font = IHTUIConfig.naviBarTitleFont

        self.nameLb.textColor = IHTUIConfig.whiteColor

        self.addSubview(self.nameLb)

        self.nameLb.snp.makeConstraints { (make) in
            make.top.equalTo(IHTUIConfig.isIphoneX ? 50 : 30)
            make.left.right.equalTo(0)
            make.height.equalTo(20)
        }

        self.nameLb.textAlignment = .center

        self.nameLb.text = "City JINAN"

        /// 定位btn
        let locationBtn = UIImageView()
        self.addSubview(locationBtn)
        locationBtn.snp.makeConstraints { (make) in
            make.width.height.equalTo(30)
            make.right.equalTo(-22)
            make.centerY.equalTo(nameLb.snp.centerY)
        }
        locationBtn.image = UIImage(named: "mainpage_location")

        locationBtn.tapActionsGesture { [weak self] in
            let con = MapModuleController()
            con.hidesBottomBarWhenPushed = true
            self?.ViewController()?.navigationController?.pushViewController(con, animated: true)
        }
    }

    func setData(name: String) {
        self.nameLb.text = name
    }

}
