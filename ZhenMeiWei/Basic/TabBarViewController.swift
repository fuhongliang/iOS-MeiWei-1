//
//  TabBarViewController.swift
//  ZhenMeiWei
//
//  Created by mac on 2019/5/16.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        createTabbar()
    }
    
    func createTabbar(){
        let home = BasicNavigationController(rootViewController: HomeViewController(nibName: nil, bundle: nil))
        let item1:UITabBarItem = UITabBarItem(title: "首页", image: UIImage(named: "bottom_ic_sy"), selectedImage: UIImage(named: "bottom_ic_sy1"))
        home.tabBarItem = item1

        let order = BasicNavigationController(rootViewController: OrderViewController(nibName: nil, bundle: nil))
        let item2:UITabBarItem = UITabBarItem(title: "订单", image: UIImage(named: "bottom_ic_ddd"), selectedImage: UIImage(named: "bottom_ic_ddd1"))
        order.tabBarItem = item2

        let me = BasicNavigationController(rootViewController: MeViewController(nibName: nil, bundle: nil))
        let item3:UITabBarItem = UITabBarItem(title: "我的", image: UIImage(named: "bottom_ic_wod"), selectedImage: UIImage(named: "bottom_ic_wod1"))
        me.tabBarItem = item3

        self.tabBar.tintColor = UIColor.hexColor(0xFFBA17)
        let tabArray = [home,order,me]
        self.viewControllers =  tabArray
        //设置tabBarItem的title，以及点击和不点击状态图片
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12)], for: .normal)
        
        //设置tabBarItem的title的字体颜色和字大小及字体样式
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12)], for: .selected)

    }

}
