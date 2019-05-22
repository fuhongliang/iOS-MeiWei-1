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
        let scrollview = UIScrollView()
        self.view.addSubview(scrollview)
        scrollview.frame = self.view.bounds
        scrollview.isPagingEnabled = false
        scrollview.isScrollEnabled = true
        scrollview.alwaysBounceVertical = true
        
        let meView = UMeView()
        meView.configUI()
        
        scrollview.addSubview(meView)

        meView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = true
    }

    
}
