//
//  UMeViewCell.swift
//  ZhenMeiWei
//
//  Created by KevinFu on 2019/5/20.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class UMeView: BaseView {

    var label = UILabel()
    var layerView = UIImageView()
    var phoneImageView = UIImageView()
    var phoneLabel = UILabel()
    var lineImageView = UIImageView()
    var labelService = UILabel()
    
    var address = UMeServicesCell()
    var myVouchers = UMeServicesCell()
    var myCollection = UMeServicesCell()

    var myReviews = UMeServicesCell()
    var helpAndFeedBack = UMeServicesCell()
    var serviceAsk = UMeServicesCell()
    
    var shopJoin = UMeServicesCell()
    var deliveryJoin = UMeServicesCell()
    var settings = UMeServicesCell()
    
    var buttomView = UIImageView()
    
    func configUI() {
        //设置背景为灰色
        self.backgroundColor = UIColor.white
        
        //用户名
        label = UILabel()
        label.text = "猫玖铲屎官"
        label.font = UIFont.systemFont(ofSize: 22)
        addSubview(label)

        label.snp.makeConstraints{
            $0.top.equalToSuperview().offset(63)
            $0.left.equalToSuperview().offset(15)
            $0.right.equalToSuperview().offset(-15)
        }
        
        //用户头像
        layerView = UIImageView()
        layerView.image = UIImage.init(named: "center_touxiang")
        addSubview(layerView)
        layerView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(48)
            $0.right.equalToSuperview().offset(-15)
            $0.width.equalTo(80)
            $0.height.equalTo(80)
        }
        
        //手机图标
        phoneImageView = UIImageView()
        phoneImageView.image = UIImage.init(named: "top_ic_shouji")
        addSubview(phoneImageView)
        phoneImageView.snp.makeConstraints{
            $0.top.equalTo(label.snp.bottom).offset(16)
            $0.width.equalTo(12)
            $0.height.equalTo(14)
            $0.left.equalToSuperview().offset(15)
        }
        
        //手机号码
        phoneLabel = UILabel()
        phoneLabel.text = "188****9999"
        addSubview(phoneLabel)
        phoneLabel.font = UIFont.systemFont(ofSize: 16)

        phoneLabel.snp.makeConstraints{
            $0.top.equalTo(label.snp.bottom).offset(16)
            $0.left.equalTo(phoneImageView.snp.right).offset(8)
        }
        
        //分割线
        lineImageView = UIImageView()
        lineImageView.backgroundColor = UIColor.hex(hexString: "#F0F0F0")
        addSubview(lineImageView)
        lineImageView.snp.makeConstraints{
            $0.top.equalTo(phoneLabel.snp.bottom).offset(34)
            $0.height.equalTo(1)
            $0.left.equalToSuperview().offset(15)
            $0.right.equalToSuperview()
        }
        
        //我的服务
        labelService = UILabel()
        labelService.text = "我的服务"
        labelService.font = UIFont.systemFont(ofSize: 17)
        addSubview(labelService)
        
        labelService.snp.makeConstraints{
            $0.top.equalTo(lineImageView.snp.bottom).offset(25)
            $0.left.equalToSuperview().offset(15)
           
        }
    
  //第一行
        //收货地址
        address = UMeServicesCell()
        address.configUI(name: "收货地址", url: "center_ic_shdz")
        addSubview(address)

        address.snp.makeConstraints{
            $0.top.equalTo(labelService.snp.bottom).offset(35)
            $0.width.equalTo(screenWidth/3)
            $0.height.equalTo(80)
        }


        //我的代金券
        myVouchers = UMeServicesCell()
        myVouchers.configUI(name: "我的代金券", url: "center_ic_djq")
        addSubview(myVouchers)
        
        myVouchers.snp.makeConstraints{
            $0.top.equalTo(labelService.snp.bottom).offset(35)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(screenWidth/3)
         $0.height.equalTo(80)
            
        }
        
        //我的收藏
        myCollection = UMeServicesCell()
        myCollection.configUI(name: "我的收藏", url: "center_ic_shouc")
        addSubview(myCollection)
        
        myCollection.snp.makeConstraints{
            $0.top.equalTo(labelService.snp.bottom).offset(35)
            $0.right.equalToSuperview()
            $0.width.equalTo(screenWidth/3)
            $0.height.equalTo(80)
            
        }
        
//第二行
        //我的评价
        myReviews = UMeServicesCell()
        myReviews.configUI(name: "我的评价", url: "center_ic_pingj")
        addSubview(myReviews)
        
        myReviews.snp.makeConstraints{
            $0.top.equalTo(address.snp.bottom).offset(35)
            $0.width.equalTo(screenWidth/3)
            $0.height.equalTo(80)
            
        }
        
        //帮助与反馈
        helpAndFeedBack = UMeServicesCell()
        helpAndFeedBack.configUI(name: "帮助与反馈", url: "center_ic_bzfk")
        addSubview(helpAndFeedBack)
        
        helpAndFeedBack.snp.makeConstraints{
            $0.top.equalTo(address.snp.bottom).offset(35)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(screenWidth/3)
            $0.height.equalTo(80)
            
        }
        
        //服务咨询
        serviceAsk = UMeServicesCell()
        serviceAsk.configUI(name: "服务咨询", url: "center_ic_kefzx")
        addSubview(serviceAsk)
        
        serviceAsk.snp.makeConstraints{
            $0.top.equalTo(address.snp.bottom).offset(35)
            $0.right.equalToSuperview()
            $0.width.equalTo(screenWidth/3)
            $0.height.equalTo(80)
            
        }
        
        
//第三行
        //商家入驻
        shopJoin = UMeServicesCell()
        shopJoin.configUI(name: "商家入驻", url: "center_ic_sjirz")
        addSubview(shopJoin)
        
        shopJoin.snp.makeConstraints{
            $0.top.equalTo(myReviews.snp.bottom).offset(35)
            $0.width.equalTo(screenWidth/3)
            $0.height.equalTo(80)
            
        }
        
        //骑手入驻
        deliveryJoin = UMeServicesCell()
        deliveryJoin.configUI(name: "骑手入驻", url: "center_ic_qsrz")
        addSubview(deliveryJoin)
        
        deliveryJoin.snp.makeConstraints{
            $0.top.equalTo(myReviews.snp.bottom).offset(35)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(screenWidth/3)
            $0.height.equalTo(80)
            
        }
        
        //设置
        settings = UMeServicesCell()
        settings.configUI(name: "设置", url: "center_ic_sz")
        addSubview(settings)
        
        settings.snp.makeConstraints{
            $0.top.equalTo(myReviews.snp.bottom).offset(35)
            $0.right.equalToSuperview()
            $0.width.equalTo(screenWidth/3)
            $0.height.equalTo(80)
        }
        
        
        //底部灰色
        buttomView = UIImageView()
        buttomView.backgroundColor = UIColor.hex(hexString: "#F5F5F5")
        addSubview(buttomView)
        buttomView.snp.makeConstraints{
            $0.top.equalTo(settings.snp.bottom)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
