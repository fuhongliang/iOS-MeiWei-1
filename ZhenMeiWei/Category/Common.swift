//
//  Common.swift
//  SwiftTest
//
//  Created by tt on 2018/10/31.
//  Copyright © 2018年 tt. All rights reserved.
//

import UIKit

let Screen_H = UIScreen.main.bounds.height
let Screen_W = UIScreen.main.bounds.width

let Status_H = UIApplication.shared.statusBarFrame.height

let LineHeight =  (1 / UIScreen.main.scale)


let is_iPhoneX = (Screen_W == 375.0 && Screen_H == 812.0 ? true : false)
let kNavibarH: CGFloat = is_iPhoneX ? 88.0 : 64.0
let kTabbarH: CGFloat = is_iPhoneX ? 49.0+34.0 : 49.0
let kStatusbarH: CGFloat = is_iPhoneX ? 44.0 : 20.0
let iPhoneXBottomH: CGFloat = 34.0
let iPhoneXTopH: CGFloat = 24.0
let ViewStart_Y = kNavibarH + kStatusbarH


let kThemeWhiteColor = UIColor.hexColor(0xFFFFFF)
let kThemeWhiteSmokeColor = UIColor.hexColor(0xF5F5F5)
let kThemeMistyRoseColor = UIColor.hexColor(0xFFE4E1)  // 薄雾玫瑰
let kThemeGainsboroColor = UIColor.hexColor(0xF3F4F5)  // 亮灰色
let kThemeOrangeRedColor = UIColor.hexColor(0xFF4500)  // 橙红色
let kThemeLimeGreenColor = UIColor.hexColor(0x32CD32)  // 酸橙绿
let kThemeSnowColor = UIColor.hexColor(0xFFFAFA)
let kThemeLightGreyColor = UIColor.hexColor(0xD3D3D3)
let kThemeGreyColor = UIColor.hexColor(0xA9A9A9)
let kThemeTomatoColor = UIColor.hexColor(0xF7583B)
let kThemeDimGrayColor = UIColor.hexColor(0x696969)
let kThemeBlackColor = UIColor.hexColor(0x000000)
let kThemeBackgroundColor = UIColor.hexColor(0xF4F4F4)


import SnapKit
import AFNetworking
