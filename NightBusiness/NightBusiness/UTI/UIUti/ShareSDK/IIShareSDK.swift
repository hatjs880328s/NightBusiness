//
//  OTShare.swift
//  OralStunts
//
//  Created by Noah_Shan on 2018/9/17.
//  Copyright © 2018 Inspur. All rights reserved.
//

import Foundation
import UIKit


/*
 分享中间件开发
 */
class OTShare: NSObject {
    override init() {
        super.init()
    }

    /// 注册&设置分发平台
    static func registerShare() {
        ShareSDK.registPlatforms { (register) in
//            register?.setupQQ(withAppId: "1109322686", appkey: "SMmtHCbX4eAzVXs0")
//            register?.setupSinaWeibo(withAppkey: "1238681065", appSecret: "9daa170c7d83186847a85f825c611223", redirectUrl: "https://hatjs880328s.github.io")
            register?.setupWeChat(withAppId: "wxd65286084621658c", appSecret: "6c906766908b4ad7725db5c08c031aee", universalLink: nil)
            register?.setupSMSOpenCountryList(false)
        }
    }

    static func share(with: UIView, title: String, subTitle: String, img: String? = nil, shareUrl: URL, imgUrl: String? = nil) {
        let anivw = UIActivityIndicatorView(frame: CGRect.zero)
        with.addSubview(anivw)
        anivw.snp.makeConstraints { (make) in
            make.centerX.equalTo(with.snp.centerX)
            make.centerY.equalTo(with.snp.centerY)
        }
        anivw.startAnimating()
        let shareParams = NSMutableDictionary()
        var realImg: String!
        if img != nil {
            realImg = img
        }
        if imgUrl != nil {
            realImg = imgUrl
        }
        if realImg.contains("http") {
            shareParams.ssdkSetupShareParams(byText: title + "\n" + subTitle, images: [realImg], url: shareUrl, title: title, type: SSDKContentType.auto)
        } else {
            let img = UIImage(named: realImg)
            shareParams.ssdkSetupShareParams(byText: title + "\n" + subTitle, images: [img], url: shareUrl, title: title, type: SSDKContentType.auto)
        }

        let actionSheet = UIAlertController(title: "分享", message: "选择分享平台", preferredStyle: UIAlertController.Style.actionSheet)
        let actionEnd = UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel, handler: nil)
        actionSheet.addAction(actionEnd)
        GCDUtils.asyncProgress(dispatchLevel: 2, asyncDispathchFunc: {
            //wx
            let actionWX = UIAlertAction(title: "微信好友", style: UIAlertAction.Style.default) { (_) in
                ShareSDK.share(SSDKPlatformType.typeWechat, parameters: shareParams, onStateChanged: { (state, _, _, _) in
                    OTShare.progressState(state: state, with: with.ViewController())
                })
            }
            actionSheet.addAction(actionWX)
            //wx time line
            let actionWXTl = UIAlertAction(title: "朋友圈", style: UIAlertAction.Style.default) { (_) in
                ShareSDK.share(SSDKPlatformType.subTypeWechatTimeline, parameters: shareParams, onStateChanged: { (state, _, _, _) in
                    OTShare.progressState(state: state, with: with.ViewController())
                })
            }
            actionSheet.addAction(actionWXTl)
            //qq
            let actionqq = UIAlertAction(title: "QQ好友", style: UIAlertAction.Style.default) { (_) in
                ShareSDK.share(SSDKPlatformType.typeQQ, parameters: shareParams, onStateChanged: { (state, _, _, _) in
                    OTShare.progressState(state: state, with: with.ViewController())
                })
            }
            actionSheet.addAction(actionqq)
            //qq zone
            let actionQQZone = UIAlertAction(title: "QQ空间", style: UIAlertAction.Style.default) { (_) in
                ShareSDK.share(SSDKPlatformType.subTypeQZone, parameters: shareParams, onStateChanged: { (state, _, _, _) in
                    OTShare.progressState(state: state, with: with.ViewController())
                })
            }
            actionSheet.addAction(actionQQZone)
            //短信
            let actionSMS = UIAlertAction(title: "短信", style: UIAlertAction.Style.default) { (_) in
                ShareSDK.share(SSDKPlatformType.typeSMS, parameters: shareParams, onStateChanged: { (state, _, _, _) in
                    OTShare.progressState(state: state, with: with.ViewController())
                })
            }
            actionSheet.addAction(actionSMS)
            //weibo
            let actionwb = UIAlertAction(title: "新浪微博", style: UIAlertAction.Style.default) { (_) in
                ShareSDK.share(SSDKPlatformType.typeSinaWeibo, parameters: shareParams, onStateChanged: { (state, _, _, _) in
                    OTShare.progressState(state: state, with: with.ViewController())
                })
            }
            actionSheet.addAction(actionwb)
        }) {
            with.ViewController()?.present(actionSheet, animated: true, completion: nil)
            anivw.stopAnimating()
        }
    }

    static func progressState(state: SSDKResponseState, with: UIViewController?) {
//        guard let realvc = with else { return }
//        switch state {
//        case .success:
//            //OTAlertVw().alertShowSingleTitle(titleInfo: "提示", message: "分享成功", from: realvc)
//        case .fail:
//            //OTAlertVw().alertShowSingleTitle(titleInfo: "提示", message: "分享失败", from: realvc)
//        case .cancel:
//            //OTAlertVw().alertShowSingleTitle(titleInfo: "提示", message: "分享取消", from: realvc)
//        default:
//            break
//        }
    }
}
