//
//  UIColorExtension.swift
//  PickerView
//
//  Created by Kaden Jack on 2019/2/25.
//  Copyright © 2019 Kaden Jack. All rights reserved.
//

import UIKit


extension UIColor {
    
    /// 自定义颜色
    public class func KRGBA(WithRed red:CGFloat = 0, green:CGFloat = 0, blue:CGFloat = 0, alpha:CGFloat = 1.0) -> UIColor
    {
        return UIColor(red: (red)/255.0, green: (green)/255.0, blue: (blue)/255.0, alpha: alpha)
    }
    
    /// 随机色
    public class func randomColor() -> UIColor {
        return UIColor.KRGBA(WithRed: CGFloat(arc4random()%255), green: CGFloat(arc4random()%255), blue: CGFloat(arc4random()%255))
    }
    
    /// 十六进制颜色
    public class func color(WithHex hex:UInt32 , alpha:CGFloat = 1.0) -> UIColor {
        let r = ((CGFloat)((hex & 0xFF0000) >> 16)) / 255.0
        let g = ((CGFloat)((hex & 0xFF00) >> 8)) / 255.0
        let b = ((CGFloat)(hex & 0xFF)) / 255.0
        
        return UIColor(red: r, green: g, blue: b, alpha: alpha)
    }
    
}

