//
//  *******************************************
//  
//  MainTabbarViewController.swift
//  NightBusiness
//
//  Created by Noah_Shan on 2020/7/3.
//  Copyright © 2018 Inpur. All rights reserved.
//  
//  *******************************************
//


import Foundation
import UIKit

class MainTabbarController: UITabBarController {

    let mainpage: UINavigationController = UINavigationController(rootViewController: UIViewController())

    let invitepage: UINavigationController = UINavigationController(rootViewController: UIViewController())

    let minepage: UINavigationController = UINavigationController(rootViewController: PersonCenterController())


    override func viewDidLoad() {
        super.viewDidLoad()
        self.initVw()
        self.initVm()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    deinit {
        print("MainTabbarController deinit ...")
    }
}

/// MARK: - view init and progress
extension MainTabbarController {

    func initVw() {
        self.viewControllers = [mainpage, invitepage, minepage]

        let maintabbar = UITabBarItem(title: "主页", image: UIImage(named: "app_tabbar_mainimg"), selectedImage: UIImage(named: "app_tabbar_mainimg"))
        self.mainpage.tabBarItem = maintabbar

        let invitetabbar = UITabBarItem(title: "邀请", image: UIImage(named: "app_tabbar_discover"), selectedImage: UIImage(named: "app_tabbar_discover"))
        self.invitepage.tabBarItem = invitetabbar

        let minetabbar = UITabBarItem(title: "我的", image: UIImage(named: "app_tabbar_mineimg"), selectedImage: UIImage(named: "app_tabbar_mineimg"))
        self.minepage.tabBarItem = minetabbar


        self.tabBar.tintColor = IHTUIConfig.mainThemeColor
        self.tabBar.barTintColor = UIColor.white
    }

}

/// MARK: - vm init and progress
extension MainTabbarController {

    func initVm() {

    }

}
