//
//  UMeServicesCell.swift
//  ZhenMeiWei
//
//  Created by KevinFu on 2019/5/21.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class UMeServicesCell: BaseView {
    
    var label = UILabel()
    var layerView = UIImageView()
    
    
    func configUI(name:String,url:String) {
    

        //图标
        layerView = UIImageView()
        layerView.image = UIImage.init(named: url)
        addSubview(layerView)
        layerView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.width.equalTo(35)
            $0.height.equalTo(35)
            $0.top.equalToSuperview()
        }
        
        //服务名称
        label = UILabel()
        label.text = name
        label.font = UIFont.systemFont(ofSize: 14)
        addSubview(label)
        
        label.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(layerView.snp.bottom).offset(10)
        }
    }
    
}
