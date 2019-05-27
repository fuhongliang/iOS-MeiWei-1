//
//  CodeLoginView.swift
//  ZhenMeiWei
//
//  Created by mac on 2019/5/24.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

protocol CodeLoginViewDelegate:NSObjectProtocol{
    func codeBack()
    func changeToPsw()
    func codeLogin()
}
class CodeLoginView: UIView ,NibloadProtocol{
    weak var delegate:CodeLoginViewDelegate?
    @IBAction func goback(_ sender: Any) {
        if delegate != nil{
            delegate?.codeBack()
        }
    }
    
    @IBAction func changeLoginStyle(_ sender: Any) {
        if delegate != nil{
            delegate?.changeToPsw()
        }
    }
    
    @IBAction func login(_ sender: Any) {
        if delegate != nil{
            delegate?.codeLogin()
        }
    }
}
