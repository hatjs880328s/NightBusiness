//
//  *******************************************
//  
//  LoopShowPic.swift
//  PS4助手
//
//  Created by Noah_Shan on 2019/6/14.
//  Copyright © 2018 Inpur. All rights reserved.
//  
//  *******************************************
//

import UIKit

// MARK: 图片轮播控件
class LoopShowPic: UIView {

    /// 轮播图的图片地址数组 可以是url,可以是imagename
    public var loopPicPath: [String] = []

    /// 轮播图上面的标题
    public var loopTtitle: [String]?

    /// action
    public var actions: ((_ idx: Int) -> Void)?

    /// 控件
    var loopControl: UIScrollView = UIScrollView()

    /// page control
    var pageControl: UIPageControl = UIPageControl()

    /// 计时器
    var timer: Timer!

    init(frame: CGRect, pics: [String], titles: [String]? = nil, action: ((_ idx: Int) -> Void)? = nil ) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.loopPicPath = pics
        self.loopTtitle = titles
        self.actions = action
        createVw()
        pageControlProgress()
        self.timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.timeGo), userInfo: nil, repeats: true)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init LoopShowPic error ")
    }

    deinit {
        self.timer.invalidate()
        self.timer = nil
    }
}

// MARK: UI
extension LoopShowPic {
    func createVw() {
        self.loopControl.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        self.addSubview(self.loopControl)
        self.loopControl.delegate = self
        self.loopControl.isPagingEnabled = true
        self.loopControl.bouncesZoom = true
        self.loopControl.showsHorizontalScrollIndicator = false
        self.loopControl.contentSize = CGSize(width: CGFloat(self.loopPicPath.count) * self.frame.size.width, height: self.frame.size.height)
        loopProgressPic()
    }

    func loopProgressPic() {
        //循环添加图片信息
        for idx in 0 ..< loopPicPath.count {
            let picImg = UIImageView()
            picImg.frame = CGRect(x: self.frame.size.width * CGFloat(idx), y: 0, width: self.frame.size.width, height: self.frame.size.height)
            if loopPicPath[idx].contains("http") {
                guard let urlPath = URL(string: loopPicPath[idx]) else { return }
                picImg.sd_setImage(with: urlPath, placeholderImage: UIImage(named: "app_default_big_image"), options: SDWebImageOptions.continueInBackground, completed: nil)
            } else {
                picImg.image = UIImage(named: loopPicPath[idx])
            }
            self.loopControl.addSubview(picImg)
            // 添加title
            guard let realTitle = self.loopTtitle else { continue }
            let titleLb = UILabel()
            picImg.addSubview(titleLb)
            titleLb.snp.makeConstraints { (make) in
                make.left.equalTo(16)
                make.right.equalTo(-16)
                make.bottom.equalTo(-8)
            }
            titleLb.numberOfLines = 0
            titleLb.textColor = UIColor.white
            titleLb.font = IHTUIConfig.font(size: 15)
            titleLb.text = realTitle[idx]
            // action
            guard let realAction = self.actions else { continue }
            picImg.tapActionsGesture {
                realAction(idx)
            }
        }
    }

    /// pagecontrol
    func pageControlProgress() {
        self.addSubview(self.pageControl)
        self.pageControl.snp.makeConstraints { (make) in
            make.top.equalTo(5)
            make.right.equalTo(-15)
            make.height.equalTo(20)
            make.width.equalTo(75)
        }
        self.pageControl.numberOfPages = self.loopPicPath.count
    }
}

// MARK: otherFunctions
extension LoopShowPic {

    @objc func timeGo() {
        goAhead()
    }

    func goAhead() {
        if self.pageControl.currentPage == self.loopPicPath.count - 1 {
            self.pageControl.currentPage = 0
            UIView.animate(withDuration: 0.3) {
                self.loopControl.contentOffset = CGPoint(x: 0, y: 0)
            }
        } else {
            self.pageControl.currentPage += 1
            UIView.animate(withDuration: 0.3) {
                self.loopControl.contentOffset = CGPoint(x: CGFloat(self.pageControl.currentPage) * self.frame.size.width, y: 0)
            }
        }
    }

    func goBehind() {
        if self.pageControl.currentPage == 0 {
            //不触发
        } else {
            self.pageControl.currentPage -= 1
            UIView.animate(withDuration: 0.3) {
                self.loopControl.contentOffset = CGPoint(x: CGFloat(self.pageControl.currentPage) * self.frame.size.width, y: 0)
            }
        }
    }
}

// MARK: actions
extension LoopShowPic {

}

// MARK: delegate
extension LoopShowPic: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let nowPage = Int(scrollView.contentOffset.x / self.frame.size.width)
        let oldPage = self.pageControl.currentPage
        if nowPage > oldPage {
            self.goAhead()
        } else if nowPage < oldPage {
            self.goBehind()
        }
    }
}
