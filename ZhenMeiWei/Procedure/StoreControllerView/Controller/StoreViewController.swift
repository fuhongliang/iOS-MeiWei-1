//
//  StoreViewController.swift
//  ZhenMeiWei
//
//  Created by mac on 2019/5/23.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController ,UIScrollViewDelegate,StoreHeaderViewDelegate{
    
    //顶部商家头像，标题
    var header = StoreHeaderView.loadNib()
    
    //商品分类，商品cell
    var mainView = StoreGoodsView()
    
    var scroll = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setUI() {
        
        header.setData()
        header.delegate = self
        view.addSubview(header)
        header.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(-Status_H)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(292+Status_H)
        }
        
        scroll.autoresizesSubviews = true
        scroll.isPagingEnabled = true
        scroll.isScrollEnabled = true
        scroll.backgroundColor = UIColor.hexColor(0xf5f5f5)
        scroll.delegate = self
        scroll.contentSize = CGSize(width: Screen_W*3, height: Screen_H-292-Status_H)
        view.addSubview(scroll)
        scroll.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.top.equalTo(header.snp.bottom)
            make.bottom.equalToSuperview()
        }
        
        mainView.setData()
        scroll.addSubview(mainView)
        mainView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.top.equalToSuperview()
            make.width.equalTo(Screen_W)
            make.height.equalToSuperview()
        }
        
    }
    
    //scrollview代理方法
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == scroll{
            let a = scrollView.contentOffset.x/Screen_W
            if a == 0{
                self.header.lineView.center.x = self.header.menuBtn.center.x
                let arr = [UIColor.hexColor(0x000000),UIColor.hexColor(0x666666),UIColor.hexColor(0x666666)]
                setColor(arr: arr as NSArray)
            }else if a == 1{
                self.header.lineView.center.x = self.header.commentBtn.center.x
                let arr = [UIColor.hexColor(0x666666),UIColor.hexColor(0x000000),UIColor.hexColor(0x666666)]
                setColor(arr: arr as NSArray)
            }else{
                self.header.lineView.center.x = self.header.businessBtn.center.x
                let arr = [UIColor.hexColor(0x666666),UIColor.hexColor(0x666666),UIColor.hexColor(0x000000)]
                setColor(arr: arr as NSArray)
            }
        }
    }
    
    //headerview 菜单按钮代理方法
    func menuAction() {
        UIView.animate(withDuration: 0.3) {
            self.scroll.contentOffset = CGPoint(x: 0, y: 0)
        }
    }
    //headerview 评价按钮代理方法
    func commentAction() {
        UIView.animate(withDuration: 0.3) {
            self.scroll.contentOffset = CGPoint(x: 1*Screen_W, y: 0)
        }
    }
    //headerview 商家按钮代理方法
    func busineesAction() {
        UIView.animate(withDuration: 0.3) {
            self.scroll.contentOffset = CGPoint(x: 2*Screen_W, y: 0)
        }
    }
    
    
    func setColor(arr:NSArray) {
        self.header.menuBtn.setTitleColor(arr[0] as? UIColor, for: UIControl.State.normal)
        self.header.commentBtn.setTitleColor(arr[1] as? UIColor, for: UIControl.State.normal)
        self.header.businessBtn.setTitleColor(arr[2] as? UIColor, for: UIControl.State.normal)
    }

}
