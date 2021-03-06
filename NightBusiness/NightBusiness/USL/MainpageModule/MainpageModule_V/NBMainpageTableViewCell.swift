//
//  *******************************************
//  
//  NBMainpageTableViewCell.swift
//  NightBusiness
//
//  Created by Noah_Shan on 2020/7/3.
//  Copyright © 2018 Inpur. All rights reserved.
//  
//  *******************************************
//


import UIKit

/// 首页cell
class NBMainpageTableViewCell: UITableViewCell {

    @IBOutlet weak var cententBgVw: UIView!

    @IBOutlet weak var topImg: UIImageView!

    @IBOutlet weak var titleLb: UILabel!

    @IBOutlet weak var subtitleLb: UILabel!

    @IBOutlet weak var hotImg: UIImageView!

    @IBOutlet weak var distanceLb: NSLayoutConstraint!

    @IBOutlet weak var firstImg: UIImageView!

    @IBOutlet weak var secondImg: UIImageView!

    @IBOutlet weak var thirdImg: UIImageView!

    @IBOutlet weak var fourthImg: UIImageView!

    /// distance lb
    @IBOutlet weak var realDisLb: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        initVw()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func initVw() {
        self.backgroundColor = UIColor.groupTableViewBackground

        self.cententBgVw.layer.cornerRadius = 5
        self.cententBgVw.layer.masksToBounds = true
        self.cententBgVw.backgroundColor = IHTUIConfig.whiteColor

        self.topImg.layer.cornerRadius = 4
        self.topImg.layer.masksToBounds = true

        self.titleLb.textColor = IHTUIConfig.mainThemeColor

        self.firstImg.layer.cornerRadius = 5
        self.firstImg.layer.masksToBounds = true
        self.firstImg.layer.borderWidth = 0.5
        self.firstImg.layer.borderColor = UIColor.groupTableViewBackground.cgColor

        self.secondImg.layer.cornerRadius = 5
        self.secondImg.layer.masksToBounds = true
        self.secondImg.layer.borderWidth = 0.5
        self.secondImg.layer.borderColor = UIColor.groupTableViewBackground.cgColor

        self.thirdImg.layer.cornerRadius = 5
        self.thirdImg.layer.masksToBounds = true
        self.thirdImg.layer.borderWidth = 0.5
        self.thirdImg.layer.borderColor = UIColor.groupTableViewBackground.cgColor
    }

    func setData(imgs: [String], title: String, subtitle: String, distance: String, hotvalue: Double) {
        self.titleLb.text = title

        self.subtitleLb.text = subtitle

        self.realDisLb.text = distance

        self.topImg.ihtHeadImgSetting(url: nil, userName: title)

        if imgs.count == 0 {
            self.firstImg.alpha = 0
            self.secondImg.alpha = 0
            self.thirdImg.alpha = 0
            self.fourthImg.alpha = 0
        } else {
            self.firstImg.alpha = 1
            self.secondImg.alpha = 1
            self.thirdImg.alpha = 1
            self.fourthImg.alpha = 1
        }

        for eachItem in 0 ..< imgs.count {
            if eachItem == 0 {
                self.firstImg.nbSetImg(url: imgs[eachItem])
            }
            if eachItem == 1 {
                self.secondImg.nbSetImg(url: imgs[eachItem])
            }
            if eachItem == 2 {
                self.thirdImg.nbSetImg(url: imgs[eachItem])
            }
        }

        self.hotImg.setHotIcons(hotvalue: hotvalue)
    }
    
}
