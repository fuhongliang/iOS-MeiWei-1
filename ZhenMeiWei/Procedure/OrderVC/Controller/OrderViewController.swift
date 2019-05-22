//
//  OrderViewController.swift
//  ZhenMeiWei
//
//  Created by mac on 2019/5/16.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,OrderTopViewDelegate{
    
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
        topview.delegate = self
        view.addSubview(topview)
        topview.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.left)
            make.top.equalTo(view.snp.top).offset(ViewStart_Y)
            make.right.equalTo(view.snp.right)
            make.height.equalTo(44)
        }
        
        tableScrollView.contentSize = CGSize(width: Screen_W*3, height: Screen_H-ViewStart_Y-44-kTabbarH)
        tableScrollView.bounces = true
        tableScrollView.delegate = self
        tableScrollView.isPagingEnabled = true
        tableScrollView.showsHorizontalScrollIndicator = false
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
        waitTableview.rowHeight = UITableView.automaticDimension
        waitTableview.separatorStyle = UITableViewCell.SeparatorStyle.none
        waitTableview.register(UINib.init(nibName: "WaitCommentCell", bundle: Bundle.main), forCellReuseIdentifier: "WaitCommentCell")
        tableScrollView.addSubview(waitTableview)

        refundTableview.backgroundColor = UIColor.hexColor(0xf5f5f5)
        refundTableview.delegate = self
        refundTableview.dataSource = self
        refundTableview.rowHeight = UITableView.automaticDimension
        refundTableview.separatorStyle = UITableViewCell.SeparatorStyle.none
        refundTableview.register(UINib.init(nibName: "WaitCommentCell", bundle: Bundle.main), forCellReuseIdentifier: "WaitCommentCell")
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
            return 10
        }else{
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == allTableview{
            let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath) as! OrderTableViewCell
            return cell
        }else if tableView == waitTableview{
            let cell = tableView.dequeueReusableCell(withIdentifier: "WaitCommentCell", for: indexPath) as! WaitCommentCell
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "WaitCommentCell", for: indexPath) as! WaitCommentCell
            cell.setDataWithModel(data: ["state":"已退款"])
            return cell
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detail = OrderDetailViewController()
        self.navigationController?.pushViewController(detail, animated: true)
        
    }
    
    //全部订单点击方法
    func clickAll() {
        UIView.animate(withDuration: 0.3) {
            self.tableScrollView.contentOffset = CGPoint(x: 0, y: 0)
        }
    }
    //待评价订单点击方法
    func clickWait() {
        UIView.animate(withDuration: 0.3) {
            self.tableScrollView.contentOffset = CGPoint(x: 1*Screen_W, y: 0)
        }
    }
    //退款订单点击方法
    func clickRefund() {
        UIView.animate(withDuration: 0.3) {
            self.tableScrollView.contentOffset = CGPoint(x: 2*Screen_W, y: 0)
        }
    }

    //scrollview  Delegate
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == tableScrollView{
            let a = scrollView.contentOffset.x/Screen_W
            print(a)
            if a == 0{
                self.topview.bottomLine.frame = CGRect(x: 0, y: 42, width: Screen_W/3, height: 2)
                topview.attribiute(object: topview.allOrderBtn, color: UIColor.hexColor(0x000000), font: 16)
                topview.attribiute(object: topview.waitComment, color: UIColor.hexColor(0x666666), font: 15)
                topview.attribiute(object: topview.refundBtn, color: UIColor.hexColor(0x666666), font: 15)
            }else if a == 1{
                self.topview.bottomLine.frame = CGRect(x: Screen_W/3, y: 42, width: Screen_W/3, height: 2)
                topview.attribiute(object: topview.allOrderBtn, color: UIColor.hexColor(0x666666), font: 15)
                topview.attribiute(object: topview.waitComment, color: UIColor.hexColor(0x000000), font: 16)
                topview.attribiute(object: topview.refundBtn, color: UIColor.hexColor(0x666666), font: 15)
            }else{
                self.topview.bottomLine.frame = CGRect(x: (Screen_W/3)*2, y: 42, width: Screen_W/3, height: 2)
                topview.attribiute(object: topview.allOrderBtn, color: UIColor.hexColor(0x666666), font: 15)
                topview.attribiute(object: topview.waitComment, color: UIColor.hexColor(0x666666), font: 15)
                topview.attribiute(object: topview.refundBtn, color: UIColor.hexColor(0x000000), font: 16)
            }
        }
    }
    
}
