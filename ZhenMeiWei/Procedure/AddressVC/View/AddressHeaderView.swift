//
//  AddressHeaderView.swift
//  ZhenMeiWei
//
//  Created by mac on 2019/5/20.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class AddressHeaderView: UIView {
    
    var addressBtn = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let topBgView = UIView()
        topBgView.backgroundColor = UIColor.hexColor(0xF2F2F2)
        topBgView.layer.cornerRadius = 17
        topBgView.layer.masksToBounds = true
        self.addSubview(topBgView)
        
        let addressIcon = UIImageView()
        addressIcon.image = UIImage.init(imageLiteralResourceName: "top_ic_dw")
        topBgView.addSubview(addressIcon)
        
        addressBtn.setTitle("深圳市", for: UIControl.State.normal)
        addressBtn.setTitleColor(UIColor.hexColor(0x000000), for: UIControl.State.normal)
        addressBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        topBgView.addSubview(addressBtn)
        
        let explandIcon = UIImageView()
        explandIcon.image = UIImage.init(imageLiteralResourceName: "icon_ic_xiala")
        topBgView.addSubview(explandIcon)
        
        let line1 = UIView()
        line1.backgroundColor = UIColor.hexColor(0xe5e5e5)
        topBgView.addSubview(line1)
        
        let searchIcon = UIImageView()
        searchIcon.image = UIImage.init(imageLiteralResourceName: "icon_sousuo")
        topBgView.addSubview(searchIcon)
        
        let searchText = UITextField()
        searchText.placeholder = "请输入您的收货地址"
        searchText.font = UIFont.systemFont(ofSize: 14)
        topBgView.addSubview(searchText)
        
        topBgView.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left).offset(15)
            make.top.equalTo(self.snp.top).offset(6)
            make.right.equalTo(self.snp.right).offset(-15)
            make.height.equalTo(34)
        }
        
        addressIcon.snp.makeConstraints {  make in
            make.left.equalTo(topBgView.snp.left).offset(15)
            make.top.equalTo(topBgView.snp.top).offset(10)
            make.width.equalTo(10)
            make.height.equalTo(14)
        }
        addressBtn.snp.makeConstraints {  make in
            make.left.equalTo(addressIcon.snp.right).offset(7)
            make.centerY.equalTo(addressIcon.snp.centerY)
        }
        explandIcon.snp.makeConstraints {  make in
            make.left.equalTo(addressBtn.snp.right).offset(5)
            make.centerY.equalTo(addressIcon.snp.centerY)
            make.width.equalTo(5)
            make.height.equalTo(4)
        }
        line1.snp.makeConstraints {  make in
            make.left.equalTo(explandIcon.snp.right).offset(10)
            make.centerY.equalTo(addressIcon.snp.centerY)
            make.width.equalTo(1)
            make.height.equalTo(23)
        }
        searchIcon.snp.makeConstraints {  make in
            make.left.equalTo(line1.snp.right).offset(10)
            make.centerY.equalTo(addressIcon.snp.centerY)
            make.width.equalTo(12)
            make.height.equalTo(12)
        }
        searchText.snp.makeConstraints {  make in
            make.left.equalTo(searchIcon.snp.right).offset(10)
            make.centerY.equalTo(addressIcon.snp.centerY)
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
