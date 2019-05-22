//
//  ShoppingCartViewController.swift
//  ZhenMeiWei
//
//  Created by mac on 2019/5/21.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class ShoppingCartViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    var mainTableview = UITableView()
    
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
    
    //清空购物车
    @objc func clearShoppingCart() {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingCartCell", for: indexPath) as! ShoppingCartCell
        cell .setDataWithModel(arr: ["111"])
        return cell
    }
}
