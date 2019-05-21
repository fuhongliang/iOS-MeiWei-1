//
//  OrderViewController.swift
//  ZhenMeiWei
//
//  Created by mac on 2019/5/16.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate{
    
    var topview = OrderTopView()
    
    var tableScrollView = UIScrollView()
    
    var allTableview = UITableView()
    var waitTableview = UITableView()
    var refundTableview = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "订单"
        view.backgroundColor = UIColor.white
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(topview)
        topview.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.left)
            make.top.equalTo(view.snp.top).offset(ViewStart_Y)
            make.right.equalTo(view.snp.right)
            make.height.equalTo(44)
        }
        
        tableScrollView.contentSize = CGSize(width: Screen_W*3, height: Screen_H-ViewStart_Y-44-kTabbarH)
        tableScrollView.bounces = true
        tableScrollView.isPagingEnabled = true
        tableScrollView.delegate = self
        tableScrollView.backgroundColor = UIColor.white
        view.addSubview(tableScrollView)
        tableScrollView.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.left)
            make.top.equalTo(topview.snp.bottom)
            make.height.equalTo(Screen_H-ViewStart_Y-44-kTabbarH)
            make.right.equalTo(view.snp.right)
        }
        
        allTableview.backgroundColor = UIColor.hexColor(0xf5f5f5)
        allTableview.delegate = self
        allTableview.dataSource = self
        allTableview.rowHeight = UITableView.automaticDimension
        allTableview.separatorStyle = UITableViewCell.SeparatorStyle.none
        allTableview.register(UINib.init(nibName: "OrderTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "OrderTableViewCell")
        tableScrollView.addSubview(allTableview)

        waitTableview.backgroundColor = UIColor.hexColor(0xf5f5f5)
        waitTableview.delegate = self
        waitTableview.dataSource = self
        tableScrollView.addSubview(waitTableview)

        refundTableview.backgroundColor = UIColor.hexColor(0xf5f5f5)
        refundTableview.delegate = self
        refundTableview.dataSource = self
        tableScrollView.addSubview(refundTableview)

        allTableview.snp.makeConstraints { (make) in
            make.left.equalTo(tableScrollView.snp.left)
            make.top.equalTo(tableScrollView.snp.top)
            make.height.equalTo(Screen_H-ViewStart_Y-44-kTabbarH)
            make.width.equalTo(Screen_W)
        }
        waitTableview.snp.makeConstraints { (make) in
            make.left.equalTo(allTableview.snp.right)
            make.top.equalTo(tableScrollView.snp.top)
            make.height.equalTo(Screen_H-ViewStart_Y-44-kTabbarH)
            make.width.equalTo(Screen_W)
        }
        refundTableview.snp.makeConstraints { (make) in
            make.left.equalTo(waitTableview.snp.right)
            make.top.equalTo(tableScrollView.snp.top)
            make.height.equalTo(Screen_H-ViewStart_Y-44-kTabbarH)
            make.width.equalTo(Screen_W)
        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == allTableview{
            return 5
        }else if tableView == waitTableview{
            return 0
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == allTableview{
            let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath) as! OrderTableViewCell
            return cell
        }
        return UITableViewCell()
    }
}
