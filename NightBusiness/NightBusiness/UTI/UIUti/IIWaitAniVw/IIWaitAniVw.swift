//
//  *******************************************
//  
//  IIWaitAniVw.swift
//  PS4助手
//
//  Created by Noah_Shan on 2019/8/23.
//  Copyright © 2018 Inpur. All rights reserved.
//  
//  *******************************************
//


import UIKit
import RxSwift

/// 仿ALI 动画vw
class IIWaitAniVw: UIView {

    var highVw: UIImageView = UIImageView()

    var middleVw: UIImageView = UIImageView()

    var lowVw: UIImageView = UIImageView()

    let anivwHeight: CGFloat = 20

    var disposeBag = DisposeBag()

    var aniFlag = true

    let highOb = Observable<Int>.timer(DispatchTimeInterval.seconds(0), period: DispatchTimeInterval.milliseconds(300), scheduler: MainScheduler.instance)

    private static var instance: IIWaitAniVw?
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        initVw()
        initData()
    }

    @objc public static func getInstace() -> IIWaitAniVw {
        if instance == nil {
            instance = IIWaitAniVw(frame: CGRect.zero)
        }
        return instance!
    }

    @objc public func showSelf(fatherVw: UIView? = nil) {
        if IIWaitAniVw.getInstace().superview != nil { return }
        let realWin = fatherVw == nil ? UIApplication.shared.keyWindow! : fatherVw!
        realWin.addSubview(self)
        self.snp.makeConstraints { (make) in
            make.centerX.equalTo(realWin.snp.centerX)
            make.centerY.equalTo(realWin.snp.centerY)
            make.width.equalTo(100)
            make.height.equalTo(60)
        }
        goAni()
    }

    @objc public func hideSelf() {
        self.removeFromSuperview()
        IIWaitAniVw.instance = nil
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    deinit {
        print("ani vw deinit ...")
    }

    /// view初始化
    func initVw() {
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        self.layer.cornerRadius = 4
        self.layer.masksToBounds = true

        self.addSubview(self.highVw)
        self.addSubview(self.middleVw)
        self.addSubview(self.lowVw)

        self.middleVw.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY)
            make.width.height.equalTo(self.anivwHeight)
        }

        self.highVw.snp.makeConstraints { (make) in
            make.width.height.equalTo(self.anivwHeight)
            make.right.equalTo(self.middleVw.snp.left).offset(-8)
            make.centerY.equalTo(self.middleVw.snp.centerY)
        }

        self.lowVw.snp.makeConstraints { (make) in
            make.width.height.equalTo(self.anivwHeight)
            make.left.equalTo(self.middleVw.snp.right).offset(8)
            make.centerY.equalTo(self.middleVw.snp.centerY)
        }
    }

    func initData() {
        self.highVw.alpha = 1
        self.middleVw.alpha = 0
        self.lowVw.alpha = 0
        self.highVw.image = UIImage(named: "app_ali_ani_high")
        self.middleVw.image = UIImage(named: "app_ali_ani_middle")
        self.lowVw.image = UIImage(named: "app_ali_ani_low")
    }

    func goAni() {
        highOb.subscribe(onNext: { [weak self] element in
            if !(self?.aniFlag ?? false) {
                self?.highVw.alpha = 0
                self?.middleVw.alpha = 0
                self?.lowVw.alpha = 0
                if element % 3 == 2 {
                    self?.aniFlag = !(self?.aniFlag ?? false)
                }
                return
            }
            if element % 3 == 0 {
                UIView.animate(withDuration: 0.1, animations: {
                    self?.highVw.alpha = 1
                    self?.middleVw.alpha = 0
                    self?.lowVw.alpha = 0
                })
            } else if element % 3 == 1 {
                UIView.animate(withDuration: 0.1, animations: {
                    self?.highVw.alpha = 0
                    self?.middleVw.alpha = 1
                    self?.lowVw.alpha = 0
                })
            } else {
                self?.aniFlag = !(self?.aniFlag ?? false)
                UIView.animate(withDuration: 0.1, animations: {
                    self?.highVw.alpha = 0
                    self?.middleVw.alpha = 0
                    self?.lowVw.alpha = 1
                })
            }

        }).disposed(by: self.disposeBag)
    }

}
