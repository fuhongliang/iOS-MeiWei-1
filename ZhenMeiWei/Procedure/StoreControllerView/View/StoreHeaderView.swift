//
//  StoreHeaderView.swift
//  ZhenMeiWei
//
//  Created by mac on 2019/5/23.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

//商家主页headview
protocol StoreHeaderViewDelegate:NSObjectProtocol {
    func menuAction()
    func commentAction()
    func busineesAction()
}
class StoreHeaderView: UIView ,NibloadProtocol{

    weak var delegate:StoreHeaderViewDelegate?
    //菜单按钮
    @IBOutlet weak var menuBtn: UIButton!
    //评价按钮
    @IBOutlet weak var commentBtn: UIButton!
    //商家按钮
    @IBOutlet weak var businessBtn: UIButton!
    //滑动色块
    @IBOutlet weak var lineView: UIView!
    var tempLab = UILabel()
    
    @IBOutlet weak var fullReduceView: UIView!
    
    func setData() {
        let arr = ["满20减10","满40减15","满100减50"]
        for i in 0..<arr.count{
            let label = UILabel()
            label.text = arr[i]
            label.textColor = UIColor.hexColor(0xFF4A4A)
            label.font = UIFont.systemFont(ofSize: 10)
            self.fullReduceView.addSubview(label)
            if i == 0{
                label.snp.makeConstraints { (make) in
                    make.left.equalToSuperview()
                    make.centerY.equalToSuperview()
                    make.height.equalToSuperview()
                }
            }else{
                label.snp.makeConstraints { (make) in
                    make.left.equalTo(tempLab.snp.right).offset(10)
                    make.centerY.equalToSuperview()
                    make.height.equalToSuperview()
                }
            }
            tempLab = label
        }
        
    }
    
    @IBAction func clickMenu(_ sender: Any) {
        let arr = [UIColor.hexColor(0x000000),UIColor.hexColor(0x666666),UIColor.hexColor(0x666666)]
        setColors(arr: arr as NSArray)
        self.lineView.center.x = menuBtn.center.x
        if delegate != nil{
            delegate?.menuAction()
        }
    }
    
    @IBAction func clickComment(_ sender: Any) {
        let arr = [UIColor.hexColor(0x666666),UIColor.hexColor(0x000000),UIColor.hexColor(0x666666)]
        setColors(arr: arr as NSArray)
        self.lineView.center.x = commentBtn.center.x
        if delegate != nil{
            delegate?.commentAction()
        }
    }
    
    @IBAction func clickBusiness(_ sender: Any) {
        let arr = [UIColor.hexColor(0x666666),UIColor.hexColor(0x666666),UIColor.hexColor(0x000000)]
        setColors(arr: arr as NSArray)
        self.lineView.center.x = businessBtn.center.x
        if delegate != nil{
            delegate?.busineesAction()
        }
    }
    
    func setColors(arr:NSArray) {
        menuBtn.setTitleColor(arr[0] as? UIColor, for: UIControl.State.normal)
        commentBtn.setTitleColor(arr[1] as? UIColor, for: UIControl.State.normal)
        businessBtn.setTitleColor(arr[2] as? UIColor, for: UIControl.State.normal)
    }
}
