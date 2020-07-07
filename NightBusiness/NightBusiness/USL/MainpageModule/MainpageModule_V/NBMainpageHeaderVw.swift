//
//  *******************************************
//  
//  NBMainpageHeaderVw.swift
//  NightBusiness
//
//  Created by Noah_Shan on 2020/7/7.
//  Copyright © 2018 Inpur. All rights reserved.
//  
//  *******************************************
//


import UIKit

class NBMainpageHeaderVw: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initVw()
    }

    required init?(coder: NSCoder) {
        fatalError("init it error...")
    }

    func initVw() {
        self.backgroundColor = UIColor.clear
        //botline
        let botLine = UIView()
        self.addSubview(botLine)
        botLine.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(50)
            make.bottom.equalTo(0)
        }
        botLine.backgroundColor = IHTUIConfig.whiteColor

        //botline
        let middle = UIView()
        self.addSubview(middle)
        middle.snp.makeConstraints { (make) in
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.top.equalTo(5)
            make.bottom.equalTo(-5)
        }
        middle.backgroundColor = IHTUIConfig.bgGrayColor
        middle.layer.cornerRadius = 5
        middle.layer.masksToBounds = true
        middle.layer.borderColor = IHTUIConfig.whiteColor.cgColor
        middle.layer.borderWidth = 0.5

        // des lb
        let deslb = UILabel()
        middle.addSubview(deslb)
        deslb.snp.makeConstraints { (make) in
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.top.equalTo(20)
            make.bottom.equalTo(-20)
        }
        deslb.numberOfLines = 0
        deslb.text = "dsafjasdlkfjl;asdjfljasldfjlasdjflksajfdlsalkjfasdlfjasld;jflajsdflj"
        deslb.font = IHTUIConfig.listTitleFont


    }

}
