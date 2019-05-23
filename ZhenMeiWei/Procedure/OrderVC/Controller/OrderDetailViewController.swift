//
//  OrderDetailViewController.swift
//  ZhenMeiWei
//
//  Created by mac on 2019/5/22.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class OrderDetailViewController: UIViewController ,OrderDetailHeaderViewDelegate,OrderDetailGoodsViewDelegate{

    var header = OrderDetailHeaderView.loadNib()
    
    var goods = OrderDetailGoodsView.loadNib()
    
    var distribution = DistributionInfoView.loadNib()
    
    var orderInfo = OrderInfoView.loadNib()
    
    var scroll = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "订单详情"
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func setupUI() {
        scroll.isScrollEnabled = true
        scroll.showsVerticalScrollIndicator = true
        scroll.backgroundColor = UIColor.hexColor(0xf5f5f5)
        scroll.frame = CGRect(x: 0, y: 0, width: Screen_W, height: Screen_H)
        view.addSubview(scroll)
        
        //订单状态
        scroll.addSubview(header)
        header.delegate = self;
        header.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(scroll.snp.top).offset(-Status_H)
            make.width.equalToSuperview()
        }
        
        //商品,包装费,配送费,总金额等显示
        goods.setDataWithModel(arr: ["1","2","3"])
        goods.layer.cornerRadius = 3
        goods.layer.masksToBounds = true
        goods.delegate = self
        scroll.addSubview(goods)
        goods.snp.makeConstraints { (make) in
            make.left.equalTo(scroll.snp.left).offset(15)
            make.top.equalTo(header.snp.bottom).offset(0)
            make.right.equalTo(scroll.snp.right).offset(-15)
            make.width.equalTo(Screen_W-30)
        }
        
        //配送信息
        distribution.layer.cornerRadius = 3
        distribution.layer.masksToBounds = true
        scroll.addSubview(distribution)
        distribution.snp.makeConstraints { (make) in
            make.left.equalTo(scroll.snp.left).offset(15)
            make.top.equalTo(goods.snp.bottom).offset(15)
            make.right.equalTo(scroll.snp.right).offset(-15)
            make.width.equalTo(Screen_W-30)
        }
        
        //订单信息
        orderInfo.layer.cornerRadius = 3
        orderInfo.layer.masksToBounds = true
        scroll.addSubview(orderInfo)
        orderInfo.snp.makeConstraints { (make) in
            make.left.equalTo(scroll.snp.left).offset(15)
            make.top.equalTo(distribution.snp.bottom).offset(15)
            make.right.equalTo(scroll.snp.right).offset(-15)
            make.bottom.equalToSuperview()
            make.width.equalTo(Screen_W-30)
        }

    }
    
    //返回
    func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    //点击商家，跳转商家主页
    func jumpStore() {
        let store = StoreViewController()
        self.navigationController?.pushViewController(store, animated: true)
    }
    

}
