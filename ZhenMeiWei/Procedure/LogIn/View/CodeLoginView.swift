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
    func getSms(phoneNumber:String)
    
}
class CodeLoginView: UIView ,NibloadProtocol{
    weak var delegate:CodeLoginViewDelegate?
    
    @IBOutlet weak var phoneNumberText: UITextField!
    
    @IBOutlet weak var codeText: UITextField!
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
    
    
    @IBAction func getSms(_ sender: UIButton) {
        if delegate != nil{
            delegate?.getSms(phoneNumber: phoneNumberText.text!)
        }
    }
}
