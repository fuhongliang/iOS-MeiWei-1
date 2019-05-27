//
//  SubmitOrderController.swift
//  ZhenMeiWei
//
//  Created by mac on 2019/5/27.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class SubmitOrderController: UIViewController {

    var topview:AddressView = AddressView.loadNib()
    
    var goodsview:OrderDetailGoodsView = OrderDetailGoodsView.loadNib()
    
    var remarkview:RemarkView = RemarkView.loadNib()
    
    var scrollView:UIScrollView = UIScrollView()
    
    var bottomview = BottomView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = true
        scrollView.backgroundColor = UIColor.hexColor(0xf5f5f5)
        scrollView.frame = CGRect(x: 0, y: 0, width: Screen_W, height: Screen_H-49)
        view.addSubview(scrollView)
        
        bottomview.backgroundColor = UIColor.white
        view.addSubview(bottomview)
        bottomview.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(49)
            make.bottom.equalToSuperview()
        }
        
        //配送地址，送达时间，支付方式
        scrollView.addSubview(topview)
        topview.snp.makeConstraints { (make) in
            make.top.equalTo(scrollView.snp.top).offset(-Status_H)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        //订单包含的商品
        goodsview.layer.cornerRadius = 3
        goodsview.layer.masksToBounds = true
        scrollView.addSubview(goodsview)
        goodsview.setDataWithModel(arr: ["111","222","333","444"])
        goodsview.snp.makeConstraints { (make) in
            make.left.equalTo(scrollView.snp.left).offset(15)
            make.top.equalTo(topview.snp.bottom).offset(15)
            make.right.equalTo(scrollView.snp.right).offset(-15)
            make.width.equalTo(Screen_W-30)
        }
        
        //备注
        remarkview.layer.cornerRadius = 3
        remarkview.layer.masksToBounds = true
        scrollView.addSubview(remarkview)
        remarkview.snp.makeConstraints { (make) in
            make.left.equalTo(scrollView.snp.left).offset(15)
            make.top.equalTo(goodsview.snp.bottom).offset(15)
            make.right.equalTo(scrollView.snp.right).offset(-15)
            make.width.equalTo(Screen_W-30)
            make.bottom.equalTo(scrollView.snp.bottom).offset(-30)
        }
    }
    
}
