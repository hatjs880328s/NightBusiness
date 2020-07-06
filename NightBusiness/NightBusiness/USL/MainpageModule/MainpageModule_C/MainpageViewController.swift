//
//  *******************************************
//  
//  MainpageViewController.swift
//  NightBusiness
//
//  Created by Noah_Shan on 2020/7/3.
//  Copyright © 2018 Inpur. All rights reserved.
//  
//  *******************************************
//

import UIKit
import Foundation

class MainpageController: IHTBaseSwiftViewController {

    let vm = MainpageVM()

    let tab = NBMainpageTabVw()
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
        print("MainpageController deinit ...")
    }
}

/// MARK: - view init and progress
extension MainpageController {

    func initVw() {
        let topVw = NBMainpagetopVw(frame: CGRect.zero, fatherVw: self.view)
        self.view.addSubview(self.tab)
        self.tab.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(topVw.snp.bottom)
            make.bottom.equalTo(0)
        }
    }

}

/// MARK: - vm init and progress
extension MainpageController {

    func initVm() {
        self.vm.reloadAction = { [weak self] _ in
            self?.tab.dataSource = self?.vm.dataSource ?? []
            self?.tab.tab.reloadData()
        }

        self.vm.getListData()
    }

}
