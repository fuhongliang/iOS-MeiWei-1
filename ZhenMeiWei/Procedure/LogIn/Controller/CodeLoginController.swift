//
//  CodeLoginController.swift
//  ZhenMeiWei
//
//  Created by mac on 2019/5/24.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class CodeLoginController: UIViewController,CodeLoginViewDelegate,PasswordLoginViewDelegate{
    

    var codeMainview = CodeLoginView.loadNib()
    var passWordMainview = PasswordLoginView.loadNib()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let tap = UITapGestureRecognizer()
        tap.addTarget(self, action: #selector(endEditing))
        view.addGestureRecognizer(tap)
        setupUI()
    }
    
    //放下键盘
    @objc func endEditing() {
        view.endEditing(true)
    }
    
    func setupUI() {
        codeMainview.delegate = self
        view.addSubview(codeMainview)
        codeMainview.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        passWordMainview.isHidden = true
        passWordMainview.delegate = self
        view.addSubview(passWordMainview)
        passWordMainview.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func pswBack() {
        self.dismiss(animated: true, completion: nil)
    }
    func changeToCode() {
        codeMainview.isHidden = false
        passWordMainview.isHidden = true
    }
    func pswLogin() {
        
    }
    
    func codeBack() {
        self.dismiss(animated: true, completion: nil)
    }
    func changeToPsw() {
        codeMainview.isHidden = true
        passWordMainview.isHidden = false
    }
    func codeLogin() {
        
    }
    
}
