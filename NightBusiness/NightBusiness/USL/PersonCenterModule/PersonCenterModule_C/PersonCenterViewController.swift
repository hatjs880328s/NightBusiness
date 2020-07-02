//
//  *******************************************
//  
//  PersonCenterViewController.swift
//  NightBusiness
//
//  Created by Noah_Shan on 2020/7/1.
//  Copyright © 2018 Inpur. All rights reserved.
//  
//  *******************************************
//


import Foundation
import UIKit

class PersonCenterController: IHTBaseSwiftViewController {

    var tab: UITableView = UITableView(frame: CGRect.zero, style: UITableView.Style.grouped)

    var vm: PersonCenterVM = PersonCenterVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initVw()
        self.initVm()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        UIApplication.shared.statusBarStyle = .lightContent
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.shared.statusBarStyle = .darkContent
    }

    deinit {
        print("PersonCenterController deinit ...")
    }
}

/// MARK: - view init and progress
extension PersonCenterController {

    func initVw() {
        self.view.addSubview(self.tab)
        self.tab.frame = CGRect(x: 0, y: 0, width: IHTUIConfig.aWeight, height: IHTUIConfig.aHeight)

        self.tab.delegate = self
        self.tab.dataSource = self

        self.tab.estimatedSectionHeaderHeight = 0
        self.tab.estimatedSectionFooterHeight = 0

        var inset = self.tab.contentInset
        inset.top = IHTUIConfig.isIphoneX ? -44 : -20
        self.tab.contentInset = inset
        self.tab.separatorStyle = .none
        self.tab.bounces = false
    }

}

/// MARK: - vm init and progress
extension PersonCenterController {

    func initVm() {

    }

}

extension PersonCenterController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0 && indexPath.row == 0 {
            guard let cell = Bundle.main.loadNibNamed("NBPersonCenterUserTableViewCell", owner: self, options: nil)?.first as? NBPersonCenterUserTableViewCell else {
                return UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "two")
            }
            cell.setData(name: "Milition Figueroa", enterprise: "云研发中心", img: "mainpage_firstcell_bg")

            return cell
        }

        if indexPath.section == 0 && indexPath.row == 1 {
            guard let cell = Bundle.main.loadNibNamed("NBPersonCenterGroupTableViewCell", owner: self, options: nil)?.first as? NBPersonCenterGroupTableViewCell else {
                return UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "two")
            }

            return cell
        }

        if indexPath.section == 2 && indexPath.row == 0 {
            guard let cell = Bundle.main.loadNibNamed("NBPersoncenterLogoutTableViewCell", owner: self, options: nil)?.first as? NBPersoncenterLogoutTableViewCell else {
                return UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "two")
            }

            return cell
        }

        let vmodel = self.vm.dataSource[indexPath.section][indexPath.row]
        guard let cell = Bundle.main.loadNibNamed("NBPersoncenterUserNormalTableViewCell", owner: self, options: nil)?.first as? NBPersoncenterUserNormalTableViewCell else {
            return UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "two")
        }
        cell.setData(title: vmodel.0, img: vmodel.1)
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            return 120 + (IHTUIConfig.isIphoneX ? 44 : 20)
        }
        if indexPath.section == 0 && indexPath.row == 1 {
            return 165
        }

        return 50
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vm.dataSource[section].count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return self.vm.dataSource.count
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 1 { return 18 }
        return 10
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
