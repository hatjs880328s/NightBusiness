//
//  *******************************************
//  
//  NBPersonCenterGroupTableViewCell.swift
//  NightBusiness
//
//  Created by Noah_Shan on 2020/7/1.
//  Copyright © 2018 Inpur. All rights reserved.
//  
//  *******************************************
//


import UIKit

/// 我的团队cell
class NBPersonCenterGroupTableViewCell: UITableViewCell {

    @IBOutlet weak var firstLb: UILabel!

    @IBOutlet weak var secondLb: UILabel!

    @IBOutlet weak var thirdLb: UILabel!

    @IBOutlet weak var secondImg: UIImageView!

    @IBOutlet weak var firstImg: UIImageView!

    @IBOutlet weak var thirdImg: UIImageView!

    @IBOutlet weak var rightImgVw: UIImageView!

    @IBOutlet weak var teamContainVw: UIView!

    @IBOutlet weak var teamVw: UILabel!

    @IBOutlet weak var contentImgVw: UIImageView!

    @IBOutlet weak var bgVw: UIView!

    @IBOutlet weak var bigBGVw: UIView!

    @IBOutlet weak var teamImg: UIImageView!

    let cellHeight: CGFloat = 165

    override func awakeFromNib() {
        super.awakeFromNib()
        self.initVw()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func initVw() {
        let pathNow = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: IHTUIConfig.aWeight, height: cellHeight), byRoundingCorners: [UIRectCorner.topLeft, UIRectCorner.topRight], cornerRadii: CGSize(width: 10, height: 10))
        let layerNow = CAShapeLayer()
        layerNow.path = pathNow.cgPath
        layerNow.frame = CGRect(x: 0, y: 0, width: IHTUIConfig.aWeight, height: cellHeight)
        self.bigBGVw.layer.mask = layerNow

        self.teamContainVw.layer.cornerRadius = 20
        self.teamContainVw.layer.masksToBounds = true
        layerNow.fillColor = UIColor.yellow.cgColor

        self.backgroundColor = UIColor(red: 61 / 255, green: 130 / 255, blue: 202 / 255, alpha: 1)

        self.firstLb.textColor = IHTUIConfig.txtMainColor
        self.secondLb.textColor = IHTUIConfig.txtMainColor
        self.thirdLb.textColor = IHTUIConfig.txtMainColor
    }
    
}
