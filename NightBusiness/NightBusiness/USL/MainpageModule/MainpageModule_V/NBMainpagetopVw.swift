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
    }

    func setData(name: String) {
        self.nameLb.text = name
    }

}
