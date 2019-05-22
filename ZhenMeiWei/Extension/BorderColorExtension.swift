//
//  BorderColorExtension.swift
//  ZhenMeiWei
//
//  Created by mac on 2019/5/22.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

@IBDesignable extension CALayer {
    @IBInspectable var borderUIColor: UIColor {
        get {
            return UIColor(cgColor: self.borderColor!)
        }
        set {
            self.borderColor = newValue.cgColor
        }
    }
}

