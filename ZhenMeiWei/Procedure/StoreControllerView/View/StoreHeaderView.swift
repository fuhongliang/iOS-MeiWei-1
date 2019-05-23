//
//  StoreHeaderView.swift
//  ZhenMeiWei
//
//  Created by mac on 2019/5/23.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class StoreHeaderView: UIView ,NibloadProtocol{

    var tempLab = UILabel()
    
    @IBOutlet weak var fullReduceView: UIView!
    
    func setData() {
        let arr = ["满20减10","满40减15","满100减50"]
        for i in 0..<arr.count{
            let label = UILabel()
            label.text = arr[i]
            label.textColor = UIColor.hexColor(0xFF4A4A)
            label.font = UIFont.systemFont(ofSize: 10)
            self.fullReduceView.addSubview(label)
            if i == 0{
                label.snp.makeConstraints { (make) in
                    make.left.equalToSuperview()
                    make.centerY.equalToSuperview()
                    make.height.equalToSuperview()
                }
            }else{
                label.snp.makeConstraints { (make) in
                    make.left.equalTo(tempLab.snp.right).offset(10)
                    make.centerY.equalToSuperview()
                    make.height.equalToSuperview()
                }
            }
            tempLab = label
        }
        
    }
    
    
}
