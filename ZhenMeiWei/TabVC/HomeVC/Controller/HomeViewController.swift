//
//  HomeViewController.swift
//  ZhenMeiWei
//
//  Created by mac on 2019/5/16.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

import SnapKit
import LLCycleScrollView

class HomeViewController: UIViewController ,LLCycleScrollViewDelegate{

    var tempBtn = UIButton()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        createUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    func createUI() {
        
        /**
            headerview
            轮播图，分类scrollview，优惠专区放在headerview上面，将整个headerview当作tableview的headerview
        */
        let headerBgView = UIView()
        view.addSubview(headerBgView)
        
        let addressIcon = UIImageView()
        addressIcon.image = UIImage.init(imageLiteralResourceName: "center_ic_shdz")
        view.addSubview(addressIcon)
        
        let addressBtn = UIButton()
        addressBtn.setTitle("深圳市海关大厦", for: UIControl.State.normal)
        addressBtn.setTitleColor(UIColor.hexColor(0x333333), for: UIControl.State.normal)
        addressBtn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        view.addSubview(addressBtn)
        
        let explandIcon = UIImageView()
        explandIcon.image = UIImage.init(imageLiteralResourceName: "icon_ic_xiala")
        view.addSubview(explandIcon)
        
        let message = UIButton()
        message.setImage(UIImage.init(imageLiteralResourceName: "top_ic_xxx"), for: UIControl.State.normal)
        view.addSubview(message)
        
        let searchBtn = UIButton()
        searchBtn.setImage(UIImage.init(imageLiteralResourceName: "icon_sousuo"), for: UIControl.State.normal)
        searchBtn.setTitle("输入商家/商品名称", for: UIControl.State.normal)
        searchBtn.setTitleColor(UIColor.hexColor(0x999999), for: UIControl.State.normal)
        searchBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        searchBtn.backgroundColor = UIColor.hexColor(0xF2F2F2)
        searchBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: -12, bottom: 0, right: 0)
        view.addSubview(searchBtn)
        
        //轮播图,自定义样式
        let imagesURLStrings = [
                "bnt_banner",
                "bnt_banner",
                "bnt_banner"
            ];
        
        let bannerView = LLCycleScrollView()
        // 是否自动滚动
        bannerView.autoScroll = true
        // 是否无限循环，此属性修改了就不存在轮播的意义了 😄
        bannerView.infiniteLoop = true
        // 滚动间隔时间(默认为2秒)
        bannerView.autoScrollTimeInterval = 3.0
        // 设置滚动方向（ vertical || horizontal ）
        bannerView.scrollDirection = .horizontal
        // 设置.system系统的UIPageControl当前显示的颜色
        bannerView.pageControlCurrentPageColor = UIColor.white
        // 模拟网络图片获取
        bannerView.imagePaths = imagesURLStrings
        bannerView.delegate = self
        headerBgView.addSubview(bannerView)
        
        let titleArr = ["美食","饮料","正餐","水果","简餐","小吃","夜宵","龙虾","简餐","小吃","夜宵","全部分类"]
        let imgArr = ["home_ic_meishi","home_ic_yinliao","home_ic_zc","home_ic_shuiguo","home_ic_jianc","home_ic_xiaochi","home_ic_yexiao","home_ic_qbfl","home_ic_jianc","home_ic_xiaochi","home_ic_yexiao","home_ic_qbfl"]
        
        let catergoryScroll = UIScrollView()
        if titleArr.count%2 == 0{
            catergoryScroll.contentSize = CGSize(width: titleArr.count/2*100+8-46, height: 162) // ContentSize属性
        }else{
            catergoryScroll.contentSize = CGSize(width: (titleArr.count/2+1)*100+8-46, height: 162) // ContentSize属性
        }
        catergoryScroll.bounces = true
        catergoryScroll.backgroundColor = .white
        headerBgView.addSubview(catergoryScroll)
        
        let discountView = DiscountView.loadNib()
        headerBgView.addSubview(discountView)

        addressIcon.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(Status_H+14)
            make.left.equalTo(view.snp.left).offset(16)
            make.width.equalTo(14)
            make.height.equalTo(18)
        }
        addressBtn.snp.makeConstraints { make in
            make.left.equalTo(addressIcon.snp.right).offset(7)
            make.centerY.equalTo(addressIcon.snp.centerY)
        }
        explandIcon.snp.makeConstraints { make in
            make.left.equalTo(addressBtn.snp.right).offset(6)
            make.centerY.equalTo(addressIcon.snp.centerY)
            make.width.equalTo(8)
            make.height.equalTo(5)
        }
        message.snp.makeConstraints { make in
            make.right.equalTo(view.snp.right).offset(-15)
            make.centerY.equalTo(addressIcon.snp.centerY)
            make.width.equalTo(18)
            make.height.equalTo(18)
        }
        searchBtn.snp.makeConstraints { make in
            make.right.equalTo(view.snp.right).offset(-15)
            make.top.equalTo(addressBtn.snp.bottom).offset(19)
            make.left.equalTo(view.snp.left).offset(15)
            make.height.equalTo(33)
        }
        headerBgView.snp.makeConstraints { make in
            make.right.equalTo(view.snp.right).offset(0)
            make.top.equalTo(searchBtn.snp.bottom).offset(0)
            make.left.equalTo(view.snp.left).offset(0)
            make.height.equalTo(476)
        }
        bannerView.snp.makeConstraints { make in
            make.right.equalTo(headerBgView.snp.right).offset(-15)
            make.top.equalTo(searchBtn.snp.bottom).offset(12)
            make.left.equalTo(headerBgView.snp.left).offset(15)
            make.height.equalTo(130)
        }
        catergoryScroll.snp.makeConstraints { make in
            make.right.equalTo(headerBgView.snp.right).offset(-15)
            make.top.equalTo(bannerView.snp.bottom).offset(0)
            make.left.equalTo(headerBgView.snp.left).offset(15)
            make.height.equalTo(162)
        }
        discountView.snp.makeConstraints { make in
            make.right.equalTo(headerBgView.snp.right).offset(0)
            make.top.equalTo(catergoryScroll.snp.bottom).offset(5)
            make.left.equalTo(headerBgView.snp.left).offset(0)
            make.height.equalTo(167)
        }

        for i in 0..<titleArr.count{
            let btn = UIButton()
            btn.setImage(UIImage.init(imageLiteralResourceName: imgArr[i]), for: UIControl.State.normal)
            catergoryScroll.addSubview(btn)
            let label = UILabel()
            label.text = titleArr[i]
            label.textColor = UIColor.hexColor(0x333333)
            label.font = UIFont.systemFont(ofSize: 12)
            catergoryScroll.addSubview(label)
            
            if i%2 == 0{
                if i == 0{
                    btn.snp.makeConstraints { make in
                        make.top.equalTo(catergoryScroll.snp.top).offset(15)
                        make.left.equalTo(catergoryScroll.snp.left).offset(15)
                        make.height.equalTo(40)
                        make.width.equalTo(40)
                    }
                    label.snp.makeConstraints { make in
                        make.top.equalTo(btn.snp.bottom).offset(4)
                        make.centerX.equalTo(btn.snp.centerX)
                    }
                }else{
                    btn.snp.makeConstraints { make in
                        make.top.equalTo(catergoryScroll.snp.top).offset(15)
                        make.left.equalTo(tempBtn.snp.right).offset(60)
                        make.height.equalTo(40)
                        make.width.equalTo(40)
                    }
                    label.snp.makeConstraints { make in
                        make.top.equalTo(btn.snp.bottom).offset(4)
                        make.centerX.equalTo(btn.snp.centerX)
                    }
                }
                
            }else{
                if i == 1{
                    btn.snp.makeConstraints { make in
                        make.top.equalTo(tempBtn.snp.bottom).offset(34)
                        make.left.equalTo(tempBtn.snp.left).offset(0)
                        make.height.equalTo(40)
                        make.width.equalTo(40)
                    }
                    label.snp.makeConstraints { make in
                        make.top.equalTo(btn.snp.bottom).offset(4)
                        make.centerX.equalTo(btn.snp.centerX)
                    }
                }else{
                    btn.snp.makeConstraints { make in
                        make.top.equalTo(tempBtn.snp.bottom).offset(34)
                        make.left.equalTo(tempBtn.snp.left).offset(0)
                        make.height.equalTo(40)
                        make.width.equalTo(40)
                    }
                    label.snp.makeConstraints { make in
                        make.top.equalTo(btn.snp.bottom).offset(4)
                        make.centerX.equalTo(btn.snp.centerX)
                    }
                }
                
            }
            tempBtn = btn
        }
        

    }
    
    //点击轮播图回调
    func cycleScrollView(_ cycleScrollView: LLCycleScrollView, didSelectItemIndex index: NSInteger) {
        print("当前图片%d",index)
    }
    

}

