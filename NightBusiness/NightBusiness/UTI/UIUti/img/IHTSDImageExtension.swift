//
//  *******************************************
//
//  IHTSDImageExtension.swift
//  Htime
//
//  Created by Noah_Shan on 2020/2/28.
//  Copyright © 2018 Inpur. All rights reserved.
//
//  *******************************************
//


import UIKit

/// 头像图片添加一个拓展方法， 结合SD 使用
extension UIImageView {

    /// 头像设置方法 - 拓展  uiimageview
    @objc func ihtHeadImgSetting(url: URL?, userName: String?) {
        self.getImg(url: url, userName: userName, useHDImg: false)

    }

    /// 头像设置方法 - 拓展  uiimageview , 是否使用大图参数添加
    @objc func ihtHeadImgSetting(url: URL?, userName: String?, useHDImg: Bool) {
        self.getImg(url: url, userName: userName, useHDImg: useHDImg)

    }

    /// 真正的处理方法
    private func getImg(url: URL?, userName: String?, useHDImg: Bool) {
        /// 用户没设置过头像的话，头像图片url中id后面为0
        let flag1 = url?.absoluteString.length ?? 0 > 0
        let flag2 = (userName?.length ?? 0) > 0
        if (!flag1 && flag2) {
            self.sd_setImage(with: NSURL.fileURL(withPath: IHTImageUti.getAvatarByText(userName ?? "", hd: useHDImg)), completed: nil)
        } else {
            self.sd_setImage(with: url, placeholderImage: UIImage(named: "addressbook_default_userimg"), completed: nil)
        }
    }

    /// 设置图片网络或者本地
    func nbSetImg(url: String) {
        if url.contains("http") {
            self.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "app_default_big_image"), options: SDWebImageOptions.continueInBackground, context: nil)
        } else {
            self.image = UIImage(named: url)
        }
    }

    /// 设置热度值[height is 20]
    func setHotIcons(hotvalue: Double) {

        for i in 0 ... 4 {
            if i  == 0 && hotvalue > 0 {
                // 第一个
                let first = UIImageView()
                self.addSubview(first)
                first.snp.makeConstraints { (make) in
                    make.right.top.bottom.equalTo(0)
                    make.height.equalTo(20)
                }
                first.image = UIImage(named: "mainpage_firstcell_hot")
            }
            if i  == 1 && hotvalue > 2 {
                // 第一个
                let second = UIImageView()
                self.addSubview(second)
                second.snp.makeConstraints { (make) in
                    make.top.bottom.equalTo(0)
                    make.right.equalTo(-20)
                    make.height.equalTo(20)
                }
                second.image = UIImage(named: "mainpage_firstcell_hot")
            }
            if i  == 2 && hotvalue > 4 {
                // 第一个
                let third = UIImageView()
                self.addSubview(third)
                third.snp.makeConstraints { (make) in
                    make.top.bottom.equalTo(0)
                    make.right.equalTo(-40)
                    make.height.equalTo(20)
                }
                third.image = UIImage(named: "mainpage_firstcell_hot")
            }
            if i  == 3 && hotvalue > 6 {
                // 第一个
                let fourth = UIImageView()
                self.addSubview(fourth)
                fourth.snp.makeConstraints { (make) in
                    make.top.bottom.equalTo(0)
                    make.right.equalTo(-60)
                    make.height.equalTo(20)
                }
                fourth.image = UIImage(named: "mainpage_firstcell_hot")
            }
            if i  == 4 && hotvalue > 8 {
                // 第一个
                let fifth = UIImageView()
                self.addSubview(fifth)
                fifth.snp.makeConstraints { (make) in
                    make.top.bottom.equalTo(0)
                    make.right.equalTo(-80)
                    make.height.equalTo(20)
                }
                fifth.image = UIImage(named: "mainpage_firstcell_hot")
            }
        }
    }
}
