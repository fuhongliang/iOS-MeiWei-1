//
//  ChooseAddressViewController.swift
//  ZhenMeiWei
//
//  Created by mac on 2019/5/20.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit



class ChooseAddressViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource,NibloadProtocol{

    var header = AddressHeaderView()
    
    var currentPlaceView = CurrentPositionView.loadNib()
    
    var mainTableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "选择收货地址"
        view.backgroundColor = UIColor.white
        
        setupUI()
        
        let barButtonItem = UIBarButtonItem(title: "新增地址", style: UIBarButtonItem.Style.plain, target: self, action: #selector(showRank))
        barButtonItem.tintColor = UIColor.hexColor(0x333333)
        self.navigationItem.rightBarButtonItem = barButtonItem
    }
    
    @objc func showRank() {
        let vc = AddNewAddressViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setupUI() {

        header.backgroundColor = UIColor.white
        view.addSubview(header)
        
        mainTableView.delegate = self;
        mainTableView.dataSource = self
        mainTableView.register(UINib.init(nibName: "AddressTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "AddressTableViewCell")
        mainTableView.rowHeight = UITableView.automaticDimension
        mainTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        mainTableView.tableFooterView = UIView.init()
        view.addSubview(mainTableView)
        
        let bgview = UIView()
        bgview.frame = CGRect(x: 0, y: 0, width: Screen_W, height: 110)
        bgview.addSubview(currentPlaceView)
        
        mainTableView.tableHeaderView = bgview
        
        header.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.left).offset(0)
            make.top.equalTo(view.snp.top).offset(ViewStart_Y)
            make.right.equalTo(view.snp.right).offset(0)
            make.height.equalTo(46)
        }
        mainTableView.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.left)
            make.top.equalTo(header.snp.bottom).offset(10)
            make.right.equalTo(view.snp.right)
            make.bottom.equalTo(view.snp.bottom)
        }
        currentPlaceView.snp.makeConstraints { (make) in
            make.left.equalTo(bgview.snp.left)
            make.top.equalTo(bgview.snp.top)
            make.right.equalTo(bgview.snp.right)
            make.bottom.equalTo(bgview.snp.bottom)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddressTableViewCell", for: indexPath) as! AddressTableViewCell
        
        return cell
    }
    
}
