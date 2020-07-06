//
//  *******************************************
//  
//  NBMainpageTabVw.swift
//  NightBusiness
//
//  Created by Noah_Shan on 2020/7/3.
//  Copyright © 2018 Inpur. All rights reserved.
//  
//  *******************************************
//


import UIKit

class NBMainpageTabVw: UIView {

    var tab: UITableView = UITableView()

    var dataSource: [NBMainpageCellVmodel] = []

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initVw()
    }

    required init?(coder: NSCoder) {
        fatalError("init self error")
    }

    func initVw() {
        self.addSubview(self.tab)
        self.tab.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(0)
        }
        self.tab.delegate = self
        self.tab.dataSource = self
    }

}

/// DEL
extension NBMainpageTabVw: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "NBMainpageTableViewCell") as? NBMainpageTableViewCell
        if cell == nil {
            cell = Bundle.main.loadNibNamed("NBMainpageTableViewCell", owner: self, options: nil)?.first as? NBMainpageTableViewCell
            if cell == nil {
                return UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "two")
            }
        }

        let model = dataSource[indexPath.row]
        cell?.setData(imgs: model.imgs, title: model.title, subtitle: model.subtitle, distance: model.distance)
        return cell!
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
