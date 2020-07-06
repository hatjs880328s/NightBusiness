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
}
