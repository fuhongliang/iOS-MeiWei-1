//
//  MeViewController.swift
//  ZhenMeiWei
//
//  Created by mac on 2019/5/16.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class MeViewController: UBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViews()
    }
    
    func setViews() {
        let meView = UMeView()
        meView.configUI()
        self.view.addSubview(meView)
        
        meView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = true
    }

    
}
