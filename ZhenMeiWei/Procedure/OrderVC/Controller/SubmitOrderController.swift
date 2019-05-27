//
//  SubmitOrderController.swift
//  ZhenMeiWei
//
//  Created by mac on 2019/5/27.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class SubmitOrderController: UIViewController {

    var topview = AddressView.loadNib()
    
    var goodsview = OrderDetailGoodsView.loadNib()
    
    var scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = true
        scrollView.backgroundColor = UIColor.hexColor(0xf5f5f5)
        scrollView.frame = CGRect(x: 0, y: 0, width: Screen_W, height: Screen_H)
        view.addSubview(scrollView)
        
        //配送地址，送达时间，支付方式
        scrollView.addSubview(topview)
        topview.snp.makeConstraints { (make) in
            make.top.equalTo(scrollView.snp.top).offset(-Status_H)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        //订单包含的商品
        scrollView.addSubview(goodsview)
        goodsview.snp.makeConstraints { (make) in
            make.left.equalTo(scrollView.snp.left).offset(15)
            make.top.equalTo(topview.snp.top).offset(15)
            make.right.equalTo(scrollView.snp.right).offset(-15)
            make.width.equalTo(Screen_W-30)
        }
    }
    
}
