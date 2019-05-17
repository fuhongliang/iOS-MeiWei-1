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
        view.addSubview(bannerView)
        
        let catergoryScroll = UIScrollView()
        catergoryScroll.contentSize = CGSize(width: 100*5+30, height: 162) // ContentSize属性
        catergoryScroll.backgroundColor = .white
        view.addSubview(catergoryScroll)
        
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
        bannerView.snp.makeConstraints { make in
            make.right.equalTo(view.snp.right).offset(-15)
            make.top.equalTo(searchBtn.snp.bottom).offset(12)
            make.left.equalTo(view.snp.left).offset(15)
            make.height.equalTo(130)
        }
        catergoryScroll.snp.makeConstraints { make in
            make.right.equalTo(view.snp.right).offset(-15)
            make.top.equalTo(bannerView.snp.bottom).offset(10)
            make.left.equalTo(view.snp.left).offset(15)
            make.height.equalTo(162)
        }
        
        let arr = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14"]

        for i in 0..<arr.count{
            let btn = UIButton()
            btn.setImage(UIImage.init(imageLiteralResourceName: "home_ic_shuiguo"), for: UIControl.State.normal)
            catergoryScroll.addSubview(btn)
            if i%2 == 0{
                if i == 0{
                    btn.snp.makeConstraints { make in
                        make.top.equalTo(catergoryScroll.snp.top).offset(15)
                        make.left.equalTo(catergoryScroll.snp.left).offset(15)
                        make.height.equalTo(40)
                        make.width.equalTo(40)
                    }
                }else{
                    btn.snp.makeConstraints { make in
                        make.top.equalTo(catergoryScroll.snp.top).offset(15)
                        make.left.equalTo(tempBtn.snp.right).offset(60)
                        make.height.equalTo(40)
                        make.width.equalTo(40)
                    }
                }
                
            }else{
                if i == 1{
                    btn.snp.makeConstraints { make in
                        make.top.equalTo(tempBtn.snp.bottom).offset(15)
                        make.left.equalTo(tempBtn.snp.left).offset(0)
                        make.height.equalTo(40)
                        make.width.equalTo(40)
                    }
                }else{
                    btn.snp.makeConstraints { make in
                        make.top.equalTo(tempBtn.snp.bottom).offset(15)
                        make.left.equalTo(tempBtn.snp.left).offset(0)
                        make.height.equalTo(40)
                        make.width.equalTo(40)
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

