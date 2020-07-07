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

    var tab: UITableView = UITableView(frame: CGRect.zero, style: UITableView.Style.grouped)

    var dataSource: [NBMainpageCellVmodel] = []

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initVw()
    }

    required init?(coder: NSCoder) {
        fatalError("init self error")
    }

    func initVw() {
        self.backgroundColor = UIColor.clear
        self.addSubview(self.tab)
        self.tab.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(0)
        }
        self.tab.backgroundColor = UIColor.clear
        self.tab.separatorStyle = .none
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
        cell?.setData(imgs: model.imgs, title: model.title, subtitle: model.subtitle, distance: model.distance, hotvalue: model.hotCount)
        return cell!
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.dataSource[indexPath.row].cellHeight
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 120
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return NBMainpageHeaderVw(frame: CGRect(x: 0, y: 0, width: IHTUIConfig.aWeight, height: 120))
    }


}
