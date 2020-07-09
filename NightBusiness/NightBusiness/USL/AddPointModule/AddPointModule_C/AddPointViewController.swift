//
//  *******************************************
//  
//  AddPointViewController.swift
//  NightBusiness
//
//  Created by Noah_Shan on 2020/7/8.
//  Copyright © 2018 Inpur. All rights reserved.
//  
//  *******************************************
//


import Foundation

class AddPointController: IHTBaseSwiftViewController {


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
        print("AddPointController deinit ...")
    }
}

/// MARK: - view init and progress
extension AddPointController {

    func initVw() {

        var vi = UIView()
        vi.frame = CGRect(x: 100, y: 200, width: 40, height: 40)
        vi.backgroundColor = UIColor.red
        self.view.addSubview(vi)
        vi.hero.id = "9090"

        vi.tapActionsGesture {
            let con = NBAddpointTwoViewController()
            con.hero.isEnabled = true
            //self.navigationController?.pushViewController(con, animated: true)
            self.present(con, animated: true, completion: nil)
        }
    }

}

/// MARK: - vm init and progress
extension AddPointController {

    func initVm() {

    }

}
