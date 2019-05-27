//
//  BottomView.swift
//  ZhenMeiWei
//
//  Created by mac on 2019/5/27.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class BottomView: UIView {
    
    var all:UILabel = UILabel()
    var price:UILabel = UILabel()
    var submitBtn:UIButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(all)
        self.addSubview(price)
        self.addSubview(submitBtn)
        
        all.text = "合计"
        all.textColor = UIColor.hexColor(0x333333)
        all.font = UIFont.systemFont(ofSize: 15)
        all.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(15)
            make.top.equalTo(self.snp.top).offset(17)
            make.bottom.equalTo(self.snp.bottom).offset(-18)
        }
        
        price.text = "￥55.8"
        price.textColor = UIColor.hexColor(0xFF4A4A)
        price.font = UIFont.systemFont(ofSize: 17)
        price.snp.makeConstraints { (make) in
            make.left.equalTo(all.snp.right).offset(4)
            make.centerY.equalTo(all.snp.centerY)
        }
        
        submitBtn.setTitle("提交订单", for: UIControl.State.normal)
        submitBtn.backgroundColor = UIColor.hexColor(0xFFBA17)
        submitBtn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        submitBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        submitBtn.snp.makeConstraints { (make) in
            make.right.equalTo(self.snp.right)
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
            make.width.equalTo(160)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
