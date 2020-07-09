//
//  *******************************************
//  
//  NBAddpointTwoViewController.swift
//  NightBusiness
//
//  Created by Noah_Shan on 2020/7/8.
//  Copyright © 2018 Inpur. All rights reserved.
//  
//  *******************************************
//


import UIKit

class NBAddpointTwoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let vi = UIView(frame: self.view.frame)

        vi.backgroundColor = UIColor.yellow

        self.view.addSubview(vi)

        vi.hero.id = "9090"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
