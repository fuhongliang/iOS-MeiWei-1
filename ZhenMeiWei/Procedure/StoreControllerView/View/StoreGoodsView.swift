//
//  StoreGoodsView.swift
//  ZhenMeiWei
//
//  Created by mac on 2019/5/23.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

//商家菜单view
class StoreGoodsView: UIView ,UITableViewDelegate,UITableViewDataSource{

    
    var leftScroll = UIScrollView()
    var mainTableview = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    func setUI() {
        leftScroll.autoresizesSubviews = true
        leftScroll.isPagingEnabled = false
        leftScroll.isScrollEnabled = true
        leftScroll.showsVerticalScrollIndicator = true
        leftScroll.backgroundColor = UIColor.hexColor(0xf5f5f5)
        self.addSubview(leftScroll)

        mainTableview.delegate = self;
        mainTableview.dataSource = self
        mainTableview.separatorStyle = UITableViewCell.SeparatorStyle.none
        mainTableview.rowHeight = UITableView.automaticDimension
        mainTableview.register(UINib.init(nibName: "GoodsTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "GoodsTableViewCell")
        self.addSubview(mainTableview)

        leftScroll.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(100)
        }
        mainTableview.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalTo(leftScroll.snp.right)
            make.bottom.equalToSuperview()
            make.width.equalTo(Screen_W-100)
        }
    }
    
    func setData() {
        let arr = ["热销","折扣","优惠","水果","生鲜"]
        for i in 0..<arr.count{
            let btn = UIButton()
            btn.setTitle(arr[i], for: UIControl.State.normal)
            btn.setTitleColor(UIColor.hexColor(0x666666), for: UIControl.State.normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
            leftScroll.addSubview(btn)
            if i == 0{
                btn.backgroundColor = UIColor.white
            }
            btn.snp.makeConstraints { (make) in
                make.centerX.equalToSuperview()
                make.top.equalTo(54*i)
                make.width.equalTo(100)
                make.height.equalTo(54)
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GoodsTableViewCell", for: indexPath) as! GoodsTableViewCell
        return cell
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
