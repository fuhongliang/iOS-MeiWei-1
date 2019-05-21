//
//  AddNewAddressViewController.swift
//  ZhenMeiWei
//
//  Created by mac on 2019/5/21.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class AddNewAddressViewController: UIViewController{

    var mainview = NewAddressView.loadNib()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "新增地址"
        setupUI()
        
        let tap  = UITapGestureRecognizer()
        tap .addTarget(self, action: #selector(hideKeyBoard))
        view.addGestureRecognizer(tap)
        
    }

    func setupUI() {
        view.addSubview(mainview)
        mainview.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.left)
            make.top.equalTo(view.snp.top)
            make.right.equalTo(view.snp.right)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
    
    @objc func hideKeyBoard() {
        view.endEditing(true)
    }
    
}
