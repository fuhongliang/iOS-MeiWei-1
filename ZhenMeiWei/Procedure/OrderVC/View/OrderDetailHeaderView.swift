//
//  OrderDetailHeaderView.swift
//  ZhenMeiWei
//
//  Created by mac on 2019/5/23.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

protocol OrderDetailHeaderViewDelegate:NSObjectProtocol {
    
    func back()
    
}

//骑手接单之前，订单状态显示
class OrderDetailHeaderView: UIView ,NibloadProtocol{

    weak var delegate:OrderDetailHeaderViewDelegate?
 
    @IBOutlet weak var bgView: UIView!

    @IBOutlet weak var topWhiteView: UIView!
    
    func  setGradientLayer() {
        let colors = [UIColor.hexColor(0xFFA517).cgColor,UIColor.hexColor(0xf5f5f5).cgColor]
        bgView.setLayerColors(colors)
    }
    
    @IBAction func backAction(_ sender: Any) {
        if delegate != nil{
            delegate?.back()
        }
    }
    
    
}
