//
//  StoreViewController.swift
//  ZhenMeiWei
//
//  Created by mac on 2019/5/23.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController {
    
    //顶部商家头像，标题
    var header = StoreHeaderView.loadNib()
    
    //商品分类，商品cell
    var mainView = StoreGoodsView()
    
    var scroll = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setUI() {
//        scroll.autoresizesSubviews = true
//        scroll.isPagingEnabled = false
//        scroll.isScrollEnabled = true
//        scroll.showsVerticalScrollIndicator = true
//        scroll.showsHorizontalScrollIndicator = true
//        scroll.backgroundColor = UIColor.hexColor(0xf5f5f5)
//        scroll.frame = CGRect(x: 0, y: 0, width: Screen_W, height: Screen_H)
//        view.addSubview(scroll)
        
        header.setData()
        view.addSubview(header)
        header.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(view.snp.top).offset(-Status_H)
        }
        
        mainView.setData()
        view.addSubview(mainView)
        mainView.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.top.equalTo(header.snp.bottom)
            make.bottom.equalToSuperview()
        }
        
    }

}
