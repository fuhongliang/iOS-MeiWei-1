//
//  CommentViewController.swift
//  ZhenMeiWei
//
//  Created by mac on 2019/5/27.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController {
    //对骑手的评价
    var riderview:CommentForRider = CommentForRider.loadNib()
    //对商家的评价
    var storeview:CommentForStore = CommentForStore.loadNib()
    
    var commentBtn:UIButton = UIButton()
    
    var scroll:UIScrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "评价"
        view.backgroundColor = UIColor.hexColor(0xf5f5f5)
        setupUI()
    }
    
    func setupUI() {
        scroll.isScrollEnabled = true
        scroll.showsVerticalScrollIndicator = true
        scroll.backgroundColor = UIColor.hexColor(0xf5f5f5)
        scroll.frame = CGRect(x: 0, y: ViewStart_Y, width: Screen_W, height: Screen_H-ViewStart_Y)
        view.addSubview(scroll)
        
        scroll.addSubview(riderview)
        riderview.snp.makeConstraints { (make) in
            make.top.equalTo(scroll.snp.top).offset(15)
            make.left.equalTo(scroll.snp.left).offset(15)
            make.right.equalTo(scroll.snp.right).offset(-15)
            make.width.equalTo(Screen_W-30)
        }
        scroll.addSubview(storeview)
        storeview.snp.makeConstraints { (make) in
            make.top.equalTo(riderview.snp.bottom).offset(15)
            make.left.equalTo(scroll.snp.left).offset(15)
            make.right.equalTo(scroll.snp.right).offset(-15)
            make.width.equalTo(Screen_W-30)
        }
        
        commentBtn.backgroundColor = UIColor.hexColor(0xFFBA17)
        commentBtn.setTitle("评价", for: UIControl.State.normal)
        commentBtn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        commentBtn.layer.cornerRadius = 3
        commentBtn.layer.masksToBounds = true
        scroll.addSubview(commentBtn)
        commentBtn.snp.makeConstraints { (make) in
            make.top.equalTo(storeview.snp.bottom).offset(30)
            make.left.equalTo(scroll.snp.left).offset(15)
            make.right.equalTo(scroll.snp.right).offset(-15)
            make.height.equalTo(44)
            make.width.equalTo(Screen_W-30)
            make.bottom.equalTo(scroll.snp.bottom).offset(-20)
        }
        
    }
}
