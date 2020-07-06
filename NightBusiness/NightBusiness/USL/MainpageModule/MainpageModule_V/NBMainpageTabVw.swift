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
    }

    required init?(coder: NSCoder) {
        fatalError("init self error")
    }

    func initVw() {
        self.addSubview(self.tab)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(NBMainpageTabVw.self))
        return UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "id")
    }
}
