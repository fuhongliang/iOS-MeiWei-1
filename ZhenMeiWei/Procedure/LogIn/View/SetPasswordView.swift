//
//  SetPasswordView.swift
//  ZhenMeiWei
//
//  Created by mac on 2019/5/24.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

protocol SetPasswordViewDelegate:NSObjectProtocol{
    func back()
    func finish()
}
class SetPasswordView: UIView ,NibloadProtocol{
    weak var delegate:SetPasswordViewDelegate?
    @IBAction func goback(_ sender: Any) {
        if delegate != nil{
            delegate?.back()
        }
    }
    
    @IBAction func finished(_ sender: Any) {
        if delegate != nil{
            delegate?.finish()
        }
    }
}
