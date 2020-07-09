//
//  *******************************************
//  
//  MapModuleViewController.swift
//  NightBusiness
//
//  Created by Noah_Shan on 2020/7/7.
//  Copyright © 2018 Inpur. All rights reserved.
//  
//  *******************************************
//


import Foundation

class MapModuleController: IHTBaseSwiftViewController {

    let mapVw: NBMapVw = NBMapVw()

    var inputPoints: [NBMainpageCellVmodel] = [NBMainpageCellVmodel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initVw()
        self.initVm()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    deinit {
        print("MapModuleController deinit ...")
    }
}

/// MARK: - view init and progress
extension MapModuleController {

    func initVw() {
        self.view.addSubview(self.mapVw)
        self.mapVw.frame = self.view.frame

        let backItem = UIButton()
        self.view.addSubview(backItem)
        backItem.snp.makeConstraints { (make) in
            make.left.equalTo(16)
            make.top.equalTo(25)
            make.width.height.equalTo(40)
        }
        backItem.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        backItem.setImage(UIImage(named: "app_backnavi"), for: UIControl.State.normal)
        backItem.tapActionsGesture { [weak self] in
            self?.dismiss(animated: true, completion: nil)
        }
        backItem.backgroundColor = IHTUIConfig.whiteColor
        backItem.layer.cornerRadius = 4
        backItem.layer.masksToBounds = true
    }

}

/// MARK: - vm init and progress
extension MapModuleController {

    func initVm() {
        self.mapVw.progressCompleteMapAction = { [weak self] in
            self?.mapVw.addPois(items: self?.inputPoints ?? [])
        }
    }

}
