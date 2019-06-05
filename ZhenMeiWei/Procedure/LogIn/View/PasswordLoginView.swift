//
//  PasswordLoginView.swift
//  ZhenMeiWei
//
//  Created by mac on 2019/5/24.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

protocol PasswordLoginViewDelegate:NSObjectProtocol {
    func pswBack()
    func changeToCode()
    func pswLogin()
}
class PasswordLoginView: UIView ,NibloadProtocol{
    weak var delegate:PasswordLoginViewDelegate?
    @IBAction func goback(_ sender: Any) {
        if delegate != nil{
            delegate?.pswBack()
        }
    }
    
    @IBAction func changeLoginStyle(_ sender: Any) {
        if delegate != nil{
            delegate?.changeToCode()
        }
    }
    @IBAction func login(_ sender: Any) {
        if delegate != nil{
            delegate?.pswLogin()
        }
    }
}
