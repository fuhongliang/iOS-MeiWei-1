//
//  ShoppingCartViewController.swift
//  ZhenMeiWei
//
//  Created by mac on 2019/5/21.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class ShoppingCartViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource,ShoppingCartCellDelegate{
    
    var mainTableview:UITableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "购物车"
        view.backgroundColor = UIColor.white
        setupUI()
    }
    
    func setupUI() {
        mainTableview.delegate = self
        mainTableview.dataSource = self
        mainTableview.register(UINib.init(nibName: "ShoppingCartCell", bundle: Bundle.main), forCellReuseIdentifier: "ShoppingCartCell")
        mainTableview.rowHeight = UITableView.automaticDimension
        mainTableview.separatorStyle = UITableViewCell.SeparatorStyle.none
        mainTableview.backgroundColor = UIColor.hexColor(0xf5f5f5)
        view.addSubview(mainTableview)
        
        mainTableview.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.top.equalTo(view.snp.top).offset(ViewStart_Y)
            make.bottom.equalTo(view.snp.bottom)
        }
        
        //添加清空按钮
        let clearBtn = UIBarButtonItem(title: "清空", style: UIBarButtonItem.Style.plain, target: self, action: #selector(clearShoppingCart))
        clearBtn.tintColor = UIColor.hexColor(0x333333)
        self.navigationItem.rightBarButtonItem = clearBtn
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ShoppingCartCell = tableView.dequeueReusableCell(withIdentifier: "ShoppingCartCell", for: indexPath) as! ShoppingCartCell
        cell.setDataWithModel(arr: ["111","222"])
        cell.delegate = self
        return cell
    }

    
    //清空购物车
    @objc func clearShoppingCart() {
        // 提示框
        let alertController = UIAlertController(
            title: "温馨提示",
            message: "确认删除该商家的所有商品？",
            preferredStyle: .alert)
        
        // 删除
        let delete = UIAlertAction(
            title: "删除",
            style: .default,
            handler: {
                (action: UIAlertAction!) -> Void in
                
        })
        // 取消
        let cancel = UIAlertAction(
            title: "取消",
            style: .cancel,
            handler: {
                (action: UIAlertAction!) -> Void in
                
        })
        alertController.addAction(delete)
        alertController.addAction(cancel)
        // 展示提示框
        self.present(alertController, animated: true, completion: nil)
    }
    
    func pay() {
        let vc = SubmitOrderController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
