//
//  *******************************************
//  
//  NBPersonCenterUserTableViewCell.swift
//  NightBusiness
//
//  Created by Noah_Shan on 2020/7/1.
//  Copyright © 2018 Inpur. All rights reserved.
//  
//  *******************************************
//


import UIKit

/// 第一个cell 用户信息
class NBPersonCenterUserTableViewCell: UITableViewCell {

    @IBOutlet weak var topBg: UIView!

    @IBOutlet weak var settingImg: UIImageView!

    @IBOutlet weak var settingLb: UILabel!

    @IBOutlet weak var userImg: UIImageView!

    @IBOutlet weak var userNameLb: UILabel!

    @IBOutlet weak var userEnterprise: UILabel!

    @IBOutlet weak var topCon: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.initVw()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    /// ui处理
    func initVw() {

        let bgVw = UIImageView(frame: CGRect(x: 0, y: 0, width: IHTUIConfig.aWeight, height: 80))

        bgVw.image = UIImage(named: "mainpage_firstcell_bg")

        self.backgroundView = bgVw

        self.userImg.layer.cornerRadius = 54 / 2

        self.userImg.layer.masksToBounds = true

        self.userImg.layer.borderColor = IHTUIConfig.whiteColor.cgColor

        self.userImg.layer.borderWidth = 1

        self.userNameLb.textColor = IHTUIConfig.whiteColor

        self.userEnterprise.textColor = IHTUIConfig.whiteColor

        self.settingLb.textColor = IHTUIConfig.whiteColor

        self.topBg.layer.cornerRadius = 15

        self.topBg.layer.masksToBounds = true

        topCon.constant += (IHTUIConfig.isIphoneX ? 44 : 20)

        self.userNameLb.font = UIFont.systemFont(ofSize: IHTUIConfig.naviBarTitleFont.pointSize, weight: UIFont.Weight.bold)
    }

    func setData(name: String, enterprise: String, img: String) {
        
        self.userImg.image = UIImage(named: img)

        self.userNameLb.text = name

        self.userEnterprise.text = enterprise
    }
    
}
