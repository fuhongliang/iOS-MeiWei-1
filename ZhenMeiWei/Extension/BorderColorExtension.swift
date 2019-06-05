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

//渐变色
extension UIView {
    //Colors：渐变色色值数组
    func setLayerColors(_ colors:[CGColor])  {
        let layer = CAGradientLayer()
        layer.frame = bounds
        layer.colors = colors
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x: 1, y: 0)
        self.layer.addSublayer(layer)
    }
    
}

