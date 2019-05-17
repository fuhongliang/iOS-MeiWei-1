//
//  UIColor+HexColor.swift
//  SwiftTest
//
//  Created by tt on 2018/10/31.
//  Copyright © 2018年 tt. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func hexColor(_ hexColor : Int64) -> UIColor {
        
        let red = ((CGFloat)((hexColor & 0xFF0000) >> 16))/255.0;
        let green = ((CGFloat)((hexColor & 0xFF00) >> 8))/255.0;
        let blue = ((CGFloat)(hexColor & 0xFF))/255.0;
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
}
