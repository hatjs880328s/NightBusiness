//
//  IHTUIConfig.swift
//  Htime
//
//  Created by xin on 2200/2/12.
//  Copyright © 2200 Inspur. All rights reserved.
//

import UIKit
import IISwiftBaseUti

/// 存储字号的key
let IHTFontChangeStorageKey = "IHTFontChangeStorageKey"

class IHTUIConfig: NSObject {

    /// 屏幕宽
    @objc static let aWeight: CGFloat = UIScreen.main.bounds.size.width

    /// 屏幕高
    @objc static let aHeight: CGFloat = UIScreen.main.bounds.size.height

    /// 是否是IPHONX
    @objc static var isIphoneX: Bool {
        return UIApplication.shared.statusBarFrame.size.height > 20
    }

    /// tab_mj footer  忽略高度
    @objc static var mjbottomIgnoreHeight: CGFloat {
        return self.isIphoneX ? 34 : 0
    }

    /// 状态栏高度
    @objc static var statusBarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.size.height
    }

    /// 导航栏高度
    @objc static var navBarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.size.height + 44.0;
    }

    /// tabbar高度
    @objc static var tabBarHeight: CGFloat {
        return mjbottomIgnoreHeight + 49.0;
    }

    /// 暗黑模式处理[获取当前模式]
    @available(iOS 13.0, *)
    @objc static var currentDisplayModel: UIUserInterfaceStyle {
        if UITraitCollection.current.userInterfaceStyle == .dark {
            return .dark
        } else {
            return .light
        }
    }

}

// Color
extension IHTUIConfig {

    /// 主题色
    @objc static var mainThemeColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (collection) -> UIColor in
                if collection.userInterfaceStyle == .dark {
                    return UIColor(red: 30 / 255, green: 107 / 255, blue: 172 / 255, alpha: 1)
                } else {
                    return UIColor(red: 15/255, green: 120/255, blue: 205/255, alpha: 1)
                }
            }
        } else {
            return UIColor(red: 15/255, green: 120/255, blue: 205/255, alpha: 1)
        }
    }

    /// 导航栏背景色
    @objc static var naviBgColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (collection) -> UIColor in
                if collection.userInterfaceStyle == .dark {
                    return UIColor(red: 35 / 255, green: 35 / 255, blue: 35 / 255, alpha: 1)
                } else {
                    return UIColor(red: 15/255, green: 120/255, blue: 205/255, alpha: 1)
                }
            }
        } else {
            return UIColor(red: 15/255, green: 120/255, blue: 205/255, alpha: 1)
        }
    }

    /// app中默认的placeholder 文案灰[暗黑模式不变]
    @objc public static let placeHolderColor: UIColor = UIColor.gray

    /// 文案主要黑色 【暗黑模式下需要修改，没有那么白】
    @objc public static var txtMainColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (collection) -> UIColor in
                if collection.userInterfaceStyle == .dark {
                    return UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
                } else {
                    return UIColor(red: 35 / 255, green: 35 / 255, blue: 35 / 255, alpha: 1)
                }
            }
        } else {
            return UIColor(red: 35 / 255, green: 35 / 255, blue: 35 / 255, alpha: 1)
        }
    }

    /// 文案副标题黑色[暗黑模式不变]
    @objc public static var subTitleGrayColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (collection) -> UIColor in
                if collection.userInterfaceStyle == .dark {
                    return UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1)
                } else {
                    return UIColor(red: 179/255, green: 179/255, blue: 179/255, alpha: 1)
                }
            }
        } else {
            return UIColor(red: 179/255, green: 179/255, blue: 179/255, alpha: 1)
        }
    }

    /// 所有分割线默认颜色 【暗黑模式下需要修改】
    @objc public static var sepLineColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (collection) -> UIColor in
                if collection.userInterfaceStyle == .dark {
                    return UIColor(red: 60 / 255, green: 60 / 255, blue: 60 / 255, alpha: 1)
                } else {
                    return UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
                }
            }
        } else {
            return UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        }
    }

    /// ui默认背景颜色 - 暗黑模式为黑 【tableview的默认背景色（接近于白色）】
    @objc public static var bgGrayColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (collection) -> UIColor in
                if collection.userInterfaceStyle == .dark {
                    return UIColor(red: 35 / 255, green: 35 / 255, blue: 35 / 255, alpha: 1)
                } else {
                    return UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
                }
            }
        } else {
            return UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
        }
    }

    /// 白色 rgba(255,255,255,1)
    @objc static var whiteColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (collection) -> UIColor in
                if collection.userInterfaceStyle == .dark {
                    return UIColor(red: 35 / 255, green: 35 / 255, blue: 35 / 255, alpha: 1)
                } else {
                    return UIColor.white
                }
            }
        } else {
            return UIColor.white
        }
    }

    /// 黑色 rgba(0,0,0,1)
    @objc static var blackColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (collection) -> UIColor in
                if collection.userInterfaceStyle == .dark {
                    return UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
                } else {
                    return UIColor(red: 35 / 255, green: 35 / 255, blue: 35 / 255, alpha: 1)
                }
            }
        } else {
            return UIColor(red: 35 / 255, green: 35 / 255, blue: 35 / 255, alpha: 1)
        }
    }

    /// 警示红色 - 我的团队解散字颜色
    @objc public static var redColor: UIColor {
        return UIColor(red: 252/255, green: 49/255, blue: 49/255, alpha: 1)
    }

    /// ui默认背景颜色 - 暗黑模式为灰色 【暗黑模式与非暗黑模式 都是灰色，但是差距不大的灰色 - 悄悄话弹出的选人】
    @objc public static var bgDarkGrayColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (collection) -> UIColor in
                if collection.userInterfaceStyle == .dark {
                    return UIColor(red: 35/255, green: 35/255, blue: 35/255, alpha: 1)
                } else {
                    return UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
                }
            }
        } else {
            return UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
        }
    }

    /// ui默认背景颜色 - 暗黑模式为浅黑色 【搜索框背景色,团队\我的团队\团队添加成员,个人资料,网盘背景色】
    @objc public static var bgDarkLightBlackColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (collection) -> UIColor in
                if collection.userInterfaceStyle == .dark {
                    return UIColor(red: 26/255, green: 26/255, blue: 26/255, alpha: 1)
                } else {
                    return UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
                }
            }
        } else {
            return UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
        }
    }

    /// ui背景色F4 - 暗黑模式为黑色 【暗黑模式与非暗黑模式 都是灰色，但是差距略大的灰色 - 聊天输入框】
    @objc public static var bgDarkF4Color: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (collection) -> UIColor in
                if collection.userInterfaceStyle == .dark {
                    return UIColor(red: 35 / 255, green: 35 / 255, blue: 35 / 255, alpha: 1)
                } else {
                    return UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
                }
            }
        } else {
            return UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        }
    }

    /// ui背景色EE - 暗黑模式为浅黑色
    @objc public static var bgDarkEEColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (collection) -> UIColor in
                if collection.userInterfaceStyle == .dark {
                    return UIColor(red: 27/255, green: 27/255, blue: 27/255, alpha: 1)
                } else {
                    return UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
                }
            }
        } else {
            return UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
        }
    }

    /// ui图片头像遮蔽颜色 - 暗黑模式为透明黑，其他为透明色
    @objc public static var imgHudColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (collection) -> UIColor in
                if collection.userInterfaceStyle == .dark {
                    return UIColor(red: 27/255, green: 27/255, blue: 27/255, alpha: 0.4)
                } else {
                    return UIColor.clear
                }
            }
        } else {
            return UIColor.clear
        }
    }

    /// 搜索联系人状态栏背景色（无导航条：暗黑为黑色、默认为白色）
    @objc static var searchNaviBgColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (collection) -> UIColor in
                if collection.userInterfaceStyle == .dark {
                    return UIColor(red: 35 / 255, green: 35 / 255, blue: 35 / 255, alpha: 1)
                } else {
                    return UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
                }
            }
        } else {
            return UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        }
    }

    /// 首页搜索栏背景色（暗黑为浅黑色、默认为白色）
    @objc static var searchBoxBgColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (collection) -> UIColor in
                if collection.userInterfaceStyle == .dark {
                    return UIColor(red: 27/255, green: 27/255, blue: 27/255, alpha: 1)
                } else {
                    return UIColor.white
                }
            }
        } else {
            return UIColor.white
        }
    }

    /// 首页邀请背景
    @objc static var inviteCardColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (collection) -> UIColor in
                if collection.userInterfaceStyle == .dark {
                    return UIColor(red: 27/255, green: 27/255, blue: 27/255, alpha: 1)
                } else {
                    return UIColor(red: 230/255, green: 244/255, blue: 255/255, alpha: 1)
                }
            }
        } else {
            return UIColor(red: 230/255, green: 244/255, blue: 255/255, alpha: 1)
        }
    }

    /// 首页邀请字体颜色
    @objc static var inviteLabelColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (collection) -> UIColor in
                if collection.userInterfaceStyle == .dark {
                    return UIColor(red: 15/255, green: 120/255, blue: 205/255, alpha: 1)
                } else {
                    return UIColor(red: 15/255, green: 120/255, blue: 205/255, alpha: 1)
                }
            }
        } else {
            return UIColor(red: 15/255, green: 120/255, blue: 205/255, alpha: 1)
        }
    }

    /// Tabbar动画背景
    @objc static var tabLottieBgColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (collection) -> UIColor in
                if collection.userInterfaceStyle == .dark {
                    return UIColor(red: 45/255, green: 45/255, blue: 45/255, alpha: 1)
                } else {
                    return UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
                }
            }
        } else {
            return UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        }
    }

    /// 文字颜色,在深色背景上的颜色,保持纯白,不随暗黑模式变化
    @objc public static var wordWhiteColor: UIColor {
        return UIColor.white
    }

    /******************新版登录页面begin***************/
    /// 副提示文字
    @objc public static var subTipColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (collection) -> UIColor in
                if collection.userInterfaceStyle == .dark {
                    return UIColor.white
                } else {
                    return UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1)
                }
            }
        } else {
            return UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1)
        }
    }

    /// placeholder文字
    @objc public static var placeholderColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (collection) -> UIColor in
                if collection.userInterfaceStyle == .dark {
                    return UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
                } else {
                    return UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1)
                }
            }
        } else {
            return UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1)
        }
    }

    /// 登录背景黑白色
    @objc static var loginBgWhiteColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (collection) -> UIColor in
                if collection.userInterfaceStyle == .dark {
                    return UIColor(red: 26/255, green: 26/255, blue: 26/255, alpha: 1)
                } else {
                    return UIColor.white
                }
            }
        } else {
            return UIColor.white
        }
    }

    /// 登录按钮不可用状态字体颜色
    @objc static var loginButtonDisableTitleColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (collection) -> UIColor in
                if collection.userInterfaceStyle == .dark {
                    return UIColor(red: 187/255, green: 187/255, blue: 187/255, alpha: 1)
                } else {
                    return UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1)
                }
            }
        } else {
            return UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1)
        }
    }

    /// 主题色
    @objc static var loginThemeColor: UIColor {
        return UIColor(red: 15/255, green: 120/255, blue: 205/255, alpha: 1)
    }

    /// 登录副标题色
    @objc static var loginSubTitleColor: UIColor {
        return UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
    }

    /// 登录组织绑定标签背景色
    @objc public static var loginTagBgColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (collection) -> UIColor in
                if collection.userInterfaceStyle == .dark {
                    return UIColor(red: 87/255, green: 87/255, blue: 87/255, alpha: 1)
                } else {
                    return UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
                }
            }
        } else {
            return UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        }
    }

    /// 登录组织绑定当前组织背景色
    @objc public static var loginCurrentOrganBgColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (collection) -> UIColor in
                if collection.userInterfaceStyle == .dark {
                    return UIColor(red: 46/255, green: 46/255, blue: 46/255, alpha: 1)
                } else {
                    return UIColor.white
                }
            }
        } else {
            return UIColor.white
        }
    }
    /******************新版登录页面end***************/

}

// Font
extension IHTUIConfig {

    /// 获取font - 提前处理; 后期有可能根据屏幕大小来处理font信息
    @objc static func font(size: CGFloat, bold: Bool = false) -> UIFont {
        if bold {
            return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.bold)
        }
        return UIFont.systemFont(ofSize: size)
    }

    /// 字体大小参数
    @objc static var fontSizeChange: CGFloat {
        get {
            if IICacheManager.getInstance().isContains(key: IHTFontChangeStorageKey) {
                guard let str = IICacheManager.getInstance().getObj(with: IHTFontChangeStorageKey) as? String else {
                    return 0
                }
                return CGFloat(str.floatValue())
            }
            return 0
        }

        set {
            IICacheManager.getInstance().saveObj(key: IHTFontChangeStorageKey, someThing: "\(newValue)" as NSString)
        }
    }

    /// 列表主标题字号
    @objc static var listTitleFont: UIFont {
        return UIFont.systemFont(ofSize: (16 + fontSizeChange) * IHTUIConfig.scaleSize)
    }

    /// 列表副标题字号
    @objc static var listSubtitleFont: UIFont {
        return UIFont.systemFont(ofSize: (14 + fontSizeChange) * IHTUIConfig.scaleSize)
    }

    /// 消耗提示语字号
    @objc static var smallAlertFont: UIFont {
        return UIFont.systemFont(ofSize: (11 + fontSizeChange) * IHTUIConfig.scaleSize)
    }

    /// 导航栏标题字号
    @objc static var naviBarTitleFont: UIFont {
        return UIFont.systemFont(ofSize: (17 + fontSizeChange) * IHTUIConfig.scaleSize)
    }

    /// 水印字号
    @objc static var waterMarkFont: UIFont {
        return UIFont.systemFont(ofSize: (25 + fontSizeChange) * IHTUIConfig.scaleSize, weight: UIFont.Weight.bold)
    }
    /// 广场应用字号
    @objc static var squareAppFont: UIFont {
        return UIFont.systemFont(ofSize: (13 + fontSizeChange) * IHTUIConfig.scaleSize)
    }

    /// 字号缩放比例
    @objc static var scaleSize: CGFloat {
        return IHTUIConfig.aWeight / 375.0
    }
}
