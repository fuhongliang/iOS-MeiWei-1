//
//  OrderDetailGoodsView.swift
//  ZhenMeiWei
//
//  Created by mac on 2019/5/22.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

/**
    订单详情页面，购买的商品信息view
 */
class OrderDetailGoodsView: UIView ,NibloadProtocol{

    var lastView = UIView()
    
    @IBOutlet weak var goodsBgView: UIView!
    
    func setDataWithModel(arr:NSArray) {
        for i in 0..<arr.count{
            let bgview:UIView = UIView()
            bgview.backgroundColor = UIColor.white
            goodsBgView.addSubview(bgview)
            if i == 0{
                if i == arr.count-1{
                    bgview.snp.makeConstraints { (make) in
                        make.left.equalTo(self.goodsBgView.snp.left).offset(0);
                        make.top.equalTo(self.goodsBgView.snp.top).offset(0);
                        make.right.equalTo(self.goodsBgView.snp.right).offset(0);
                        make.bottom.equalTo(self.goodsBgView.snp.bottom).offset(0)
                    }
                }else{
                    bgview.snp.makeConstraints { (make) in
                        make.left.equalTo(self.goodsBgView.snp.left).offset(0);
                        make.top.equalTo(self.goodsBgView.snp.top).offset(0);
                        make.right.equalTo(self.goodsBgView.snp.right).offset(0);
                    }
                }

            }else if i == arr.count-1{
                bgview.snp.makeConstraints { (make) in
                    make.left.equalTo(self.goodsBgView.snp.left).offset(0);
                    make.top.equalTo(lastView.snp.bottom).offset(0);
                    make.right.equalTo(self.goodsBgView.snp.right).offset(0);
                    make.bottom.equalTo(self.goodsBgView.snp.bottom)
                }
            }else{
                bgview.snp.makeConstraints { (make) in
                    make.left.equalTo(self.goodsBgView.snp.left).offset(0);
                    make.top.equalTo(lastView.snp.bottom).offset(0);
                    make.right.equalTo(self.goodsBgView.snp.right).offset(0);
                }
            }
            lastView = bgview
            let goodsImg = UIImageView()
            goodsImg.image = UIImage.init(imageLiteralResourceName: "tab_bnt_bj_xs")
            bgview.addSubview(goodsImg)

            let title = UILabel()
            title.text = "麒麟西瓜"
            title.numberOfLines = 0
            title.font = UIFont.systemFont(ofSize: 17)
            title.textColor = UIColor.hexColor(0x000000)
            bgview.addSubview(title)

            let number = UILabel()
            number.text = "x2"
            number.font = UIFont.systemFont(ofSize: 14)
            number.textColor = UIColor.hexColor(0x000000)
            bgview.addSubview(number)

            let price = UILabel()
            price.text = "¥66.00"
            price.font = UIFont.systemFont(ofSize: 17)
            price.textColor = UIColor.hexColor(0xFF4A4A)
            bgview.addSubview(price)

            goodsImg.snp.makeConstraints { (make) in
                make.left.equalTo(bgview.snp.left).offset(15);
                make.top.equalTo(bgview.snp.top).offset(10);
                make.width.equalTo(44)
                make.height.equalTo(44)
                make.bottom.equalTo(bgview.snp.bottom).offset(-10)
            }
            title.snp.makeConstraints { (make) in
                make.left.equalTo(goodsImg.snp.right).offset(13);
                make.top.equalTo(goodsImg.snp.top);
                make.right.equalTo(bgview.snp.right).offset(-15);
            }
            number.snp.makeConstraints { (make) in
                make.left.equalTo(goodsImg.snp.right).offset(13);
                make.bottom.equalTo(goodsImg.snp.bottom);
            }
            price.snp.makeConstraints { (make) in
                make.right.equalTo(bgview.snp.right).offset(-15);
                make.bottom.equalTo(goodsImg.snp.bottom);
            }

        }
    }
}
