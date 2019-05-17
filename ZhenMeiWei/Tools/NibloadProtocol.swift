//
//  ViewForXib.swift
//  ZhenMeiWei
//
//  Created by mac on 2019/5/17.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
import UIKit

protocol NibloadProtocol {
    
}

extension NibloadProtocol where Self : UIView{
    /*
     static func loadNib(_ nibNmae :String = "") -> Self{
     let nib = nibNmae == "" ? "\(self)" : nibNmae
     return Bundle.main.loadNibNamed(nib, owner: nil, options: nil)?.first as! Self
     }
     */
    static func loadNib(_ nibNmae :String? = nil) -> Self{
        return Bundle.main.loadNibNamed(nibNmae ?? "\(self)", owner: nil, options: nil)?.first as! Self
    }
}
