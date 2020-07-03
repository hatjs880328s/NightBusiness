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
        _ = NBMainpagetopVw(frame: CGRect.zero, fatherVw: self.view)
    }

}

/// MARK: - vm init and progress
extension MainpageController {

    func initVm() {

    }

}
