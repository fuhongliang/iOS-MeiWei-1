//
//  SetPassword.swift
//  ZhenMeiWei
//
//  Created by mac on 2019/5/24.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class SetPassword: UIViewController ,SetPasswordViewDelegate{
    func finish() {
        
    }
    

    var mainview = SetPasswordView.loadNib()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        //添加手势，收起键盘
        let tap = UITapGestureRecognizer()
        tap.addTarget(self, action: #selector(endEditing))
        view.addGestureRecognizer(tap)
        
        setupUI()
    }
    
    func setupUI() {
        mainview.delegate = self
        view.addSubview(mainview)
        mainview.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    //放下键盘
    @objc func endEditing() {
        view.endEditing(true)
    }
    
    func back() {
        self.dismiss(animated: true, completion: nil)
    }

}
