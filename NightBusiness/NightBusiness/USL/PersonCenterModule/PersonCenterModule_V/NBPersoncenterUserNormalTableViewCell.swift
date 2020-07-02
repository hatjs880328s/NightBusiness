//
//  *******************************************
//  
//  NBPersoncenterUserNormalTableViewCell.swift
//  NightBusiness
//
//  Created by Noah_Shan on 2020/7/2.
//  Copyright © 2018 Inpur. All rights reserved.
//  
//  *******************************************
//


import UIKit

/// 用户中心普通cell
class NBPersoncenterUserNormalTableViewCell: UITableViewCell {

    @IBOutlet weak var topImg: UIImageView!

    @IBOutlet weak var titleLb: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.initVw()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func initVw() {
        //botline
        let botLine = UIView()
        self.addSubview(botLine)
        botLine.snp.makeConstraints { (make) in
            make.left.equalTo(13)
            make.right.equalTo(0)
            make.height.equalTo(0.5)
            make.bottom.equalTo(0)
        }
        botLine.backgroundColor = IHTUIConfig.sepLineColor
        self.titleLb.textColor = IHTUIConfig.txtMainColor
    }

    func setData(title: String, img: String) {
        self.titleLb.text = title
        self.topImg.image = UIImage(named: img)
    }
    
}
