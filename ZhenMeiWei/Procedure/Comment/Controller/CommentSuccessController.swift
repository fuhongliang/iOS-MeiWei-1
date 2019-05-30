//
//  CommentSuccessController.swift
//  ZhenMeiWei
//
//  Created by mac on 2019/5/28.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class CommentSuccessController: UIViewController {

    var mainview = CommentSuccessView.loadNib()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "评价成功"
        view.backgroundColor = UIColor.white
        
        view.addSubview(mainview)
        mainview.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalTo(view.snp.top).offset(ViewStart_Y)
        }
    }

}
