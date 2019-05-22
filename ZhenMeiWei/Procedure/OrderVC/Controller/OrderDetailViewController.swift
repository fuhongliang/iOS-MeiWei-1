//
//  OrderDetailViewController.swift
//  ZhenMeiWei
//
//  Created by mac on 2019/5/22.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class OrderDetailViewController: UIViewController {

    var goods = OrderDetailGoodsView.loadNib()
    
    var distribution = DistributionInfoView.loadNib()
    
    var orderInfo = OrderInfoView.loadNib()
    
    var scroll = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "订单详情"
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.scroll.contentSize = CGSize(width: Screen_W, height: 1000)
    }
    
    func setupUI() {
        
        scroll.autoresizesSubviews = true
        scroll.isPagingEnabled = false
        scroll.isScrollEnabled = true
        scroll.showsVerticalScrollIndicator = true
        scroll.showsHorizontalScrollIndicator = true
        scroll.backgroundColor = UIColor.hexColor(0xf5f5f5)
        scroll.frame = CGRect(x: 0, y: ViewStart_Y, width: Screen_W, height: Screen_H-ViewStart_Y)
        view.addSubview(scroll)
        
        goods.setDataWithModel(arr: ["1","2","3"])
        goods.layer.cornerRadius = 3
        goods.layer.masksToBounds = true
        scroll.addSubview(goods)
        goods.snp.makeConstraints { (make) in
            make.left.equalTo(scroll.snp.left).offset(15)
            make.top.equalTo(scroll.snp.top).offset(15)
            make.right.equalTo(scroll.snp.right).offset(-15)
            make.width.equalTo(Screen_W-30)
        }
        
        distribution.layer.cornerRadius = 3
        distribution.layer.masksToBounds = true
        scroll.addSubview(distribution)
        distribution.snp.makeConstraints { (make) in
            make.left.equalTo(scroll.snp.left).offset(15)
            make.top.equalTo(goods.snp.bottom).offset(15)
            make.right.equalTo(scroll.snp.right).offset(-15)
            make.width.equalTo(Screen_W-30)
        }
        
        orderInfo.layer.cornerRadius = 3
        orderInfo.layer.masksToBounds = true
        scroll.addSubview(orderInfo)
        orderInfo.snp.makeConstraints { (make) in
            make.left.equalTo(scroll.snp.left).offset(15)
            make.top.equalTo(distribution.snp.bottom).offset(15)
            make.right.equalTo(scroll.snp.right).offset(-15)
            make.width.equalTo(Screen_W-30)
        }
    }
    

}
