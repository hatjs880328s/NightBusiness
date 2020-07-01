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
        print("PersonCenterController deinit ...")
    }
}

/// MARK: - view init and progress
extension PersonCenterController {

    func initVw() {
        self.view.addSubview(self.tab)
        self.tab.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(0)
        }
        self.tab.delegate = self
        self.tab.dataSource = self

        self.tab.estimatedSectionHeaderHeight = 0
        self.tab.estimatedSectionFooterHeight = 0
    }

}

/// MARK: - vm init and progress
extension PersonCenterController {

    func initVm() {

    }

}

extension PersonCenterController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = Bundle.main.loadNibNamed("NBPersonCenterUserTableViewCell", owner: self, options: nil)?.first as? NBPersonCenterUserTableViewCell else {
                return UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "two")
            }
            cell.setData(name: "Milition Figueroa", enterprise: "云研发中心", img: "mainpage_firstcell_bg")

            return cell
        }

        return UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "two")
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
}
