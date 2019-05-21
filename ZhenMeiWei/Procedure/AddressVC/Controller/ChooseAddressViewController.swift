//
//  ChooseAddressViewController.swift
//  ZhenMeiWei
//
//  Created by mac on 2019/5/20.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit



class ChooseAddressViewController: UIViewController {

    var header = AddressHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "选择收货地址"
        view.backgroundColor = UIColor.white
        
        setUpUI()
    }
    
    func setUpUI() {

        header.backgroundColor = UIColor.white
        view.addSubview(header)
        header.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.left).offset(0)
            make.top.equalTo(view.snp.top).offset(ViewStart_Y)
            make.right.equalTo(view.snp.right).offset(0)
            make.height.equalTo(44)
        }
        
    }
    
}
