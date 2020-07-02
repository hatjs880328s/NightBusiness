//
//  *******************************************
//  
//  NBPersoncenterLogoutTableViewCell.swift
//  NightBusiness
//
//  Created by Noah_Shan on 2020/7/2.
//  Copyright © 2018 Inpur. All rights reserved.
//  
//  *******************************************
//


import UIKit

class NBPersoncenterLogoutTableViewCell: UITableViewCell {

    @IBOutlet weak var logoutBtn: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = IHTUIConfig.bgGrayColor
        self.logoutBtn.layer.cornerRadius = 4
        self.logoutBtn.layer.masksToBounds = true
        self.logoutBtn.textColor = IHTUIConfig.redColor
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
