//
//  IHTBaseSwiftViewController.swift
//  Htime
//
//  Created by xin on 2020/2/12.
//  Copyright © 2020 Inspur. All rights reserved.
//

import UIKit

/// SWIFT版本基础vc
class IHTBaseSwiftViewController: UIViewController {

    @objc public var rightBtnaction: (() -> Void)?

    @objc public var letBtnaction: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        baseinitVw()
        initSelfNavi()
        let gesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(self.handleLeftSwipe(ges:)))
        gesture.edges = .left
        self.view.addGestureRecognizer(gesture)
        self.view.isUserInteractionEnabled = true
    }

    func baseinitVw() {
        //self.edgesForExtendedLayout = .bottom
        self.view.backgroundColor = IHTUIConfig.whiteColor
    }

    /// 显示左侧标题[只有标题]
    public func showLeftTitle(title: String) {
        let item = UIBarButtonItem()
        let customLb = UILabel(frame: CGRect(x: 16, y: 24, width: 70, height: 18))
        customLb.text = title
        customLb.font = IHTUIConfig.naviBarTitleFont
        customLb.textColor = UIColor.white
        item.customView = customLb
        self.navigationItem.leftBarButtonItem = item
        customLb.tapActionsGesture { [weak self] in
            self?.letBtnaction?()
        }
    }

    /// 显示左侧标题和返回按钮
    public func showTitleAndBackBtn(title: String) {
        let item = UIBarButtonItem()
        // title
        let customLb = UILabel(frame: CGRect(x: 25, y: 0, width: 150, height: 24))
        customLb.text = title
        customLb.font = IHTUIConfig.naviBarTitleFont
        customLb.textColor = UIColor.white
        // back btn  [17 * 33]
        let backBtn = UIImageView(frame: CGRect(x: 0, y: 3, width: 8.5, height: 16))
        backBtn.image = UIImage(named: "base_back")
        // custom vw
        let cusvw = UIView(frame: CGRect(x: 16, y: 20, width: 125, height: 20))
        cusvw.addSubview(customLb)
        cusvw.addSubview(backBtn)

        cusvw.tapActionsGesture { [weak self] in
            self?.letBtnaction?()
        }

        item.customView = cusvw
        self.navigationItem.leftBarButtonItem = item
    }

    /// 显示右侧的确定按钮
    public func showRightCountLb(info: String, bold: Bool = false) {
        let item = UIBarButtonItem()
        let customLb = UILabel(frame: CGRect(x: 16, y: 24, width: 70, height: 30))
        customLb.text = info
        if bold {
            customLb.font = UIFont.systemFont(ofSize: IHTUIConfig.listTitleFont.pointSize, weight: UIFont.Weight.bold)
        } else {
            customLb.font = IHTUIConfig.listTitleFont
        }
        customLb.textColor = UIColor.white
        customLb.textAlignment = .right
        item.customView = customLb
        self.navigationItem.rightBarButtonItem = item

        customLb.tapActionsGesture { [weak self] in
            self?.rightBtnaction?()
        }
    }

    /// 设置右侧点击按钮
    public func showRightImg(img: String) {
        let item = UIBarButtonItem()
        let customLb = UIButton(frame: CGRect(x: 16, y: 24, width: 45, height: 45))
        customLb.contentEdgeInsets = UIEdgeInsets(top: 7.5, left: 7.5, bottom: 7.5, right: 7.5)
        customLb.setImage(UIImage(named: img), for: UIControl.State.normal)
        item.customView = customLb
        self.navigationItem.rightBarButtonItem = item

        customLb.tapActionsGesture { [weak self] in
            self?.rightBtnaction?()
        }
    }

    /// 设置中间标题
    public func setMiddleTitle(title: String) {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 24))
        label.text = title
        label.textColor = UIColor.white
        label.font = IHTUIConfig.naviBarTitleFont
        label.textAlignment = .center
        self.navigationItem.titleView = label
    }

    /// 导航栏初始化
    func initSelfNavi() {
        self.navigationController?.navigationBar.barTintColor = IHTUIConfig.naviBgColor
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }

    /// 左侧返回
    @objc func handleLeftSwipe(ges: UIScreenEdgePanGestureRecognizer) {
        if ges.state != .ended { return }
        self.navigationController?.popViewController(animated: true)
    }

    /// 隐藏导航栏下面的横线
    func hideTABBarLine() {
        Utilities.findHairlineImageViewUnder(self.navigationController?.navigationBar)?.isHidden = true
    }

    /// 像是导航栏下面的横线
    func showTABBarLine() {
        Utilities.findHairlineImageViewUnder(self.navigationController?.navigationBar)?.isHidden = false
    }

}
