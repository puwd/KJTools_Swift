//
//  KJViewExtension.swift
//  PickerView
//
//  Created by Kaden Jack on 2019/2/23.
//  Copyright © 2019 Kaden Jack. All rights reserved.
//

// https://github.com/ChocolatesChen/CardView

import UIKit

//MARK: - 视图圆角、边框、阴影
extension UIView {
    
    /// 设置视图(圆角 + 边框)
    ///
    /// - Parameters:
    ///   - ConrnerRadius: 圆角大小(默认为0)
    ///   - conrnerCorner: 圆角方向(默认为全部方向,多个方向为 [UIRectCorner.topLeft, UIRectCorner.topRight] )
    ///   - borderWidth: 边框宽度(默认为0)
    ///   - borderColor: 边框颜色
    func setShowVisual(With conrnerRadius: CGFloat = 0.0 ,conrnerCorner:UIRectCorner = .allCorners ,borderWidth:CGFloat = 0.0 ,borderColor:UIColor = UIColor.clear) {
        
        var maskPath = UIBezierPath()
        // 使用贝塞尔曲线绘制圆角
        maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: conrnerCorner, cornerRadii: CGSize(width: conrnerRadius, height: conrnerRadius))
        
        //
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        
        // 填充颜色
        if (self.backgroundColor != nil) {
            maskLayer.fillColor = self.backgroundColor?.cgColor
        } else {
            maskLayer.fillColor = UIColor.white.cgColor
        }
        // 边线颜色
        maskLayer.strokeColor = borderColor.cgColor
        // 边线宽度
        maskLayer.lineWidth = borderWidth
        
        layer.mask = maskLayer
    }
}


//MARK: - UIView frame
protocol MySize {}

extension UIView: MySize {}

extension MySize where Self: UIView {
    
    /// Shortcut for frame.origin.x
    var x : CGFloat {
        get {
            return self.frame.origin.x
        } set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    
    /// Shortcut for frame.origin.y
    var y : CGFloat {
        get {
            return self.frame.origin.y
        } set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    /// Shortcut for frame.size.width
    var width: CGFloat {
        get {
            return self.frame.width
        } set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }
    
    /// Shortcut for frame.size.height
    var height: CGFloat {
        get {
            return self.frame.height
        } set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
    
    /// Shortcut for frame.origin.x + frame.size.width
    var right : CGFloat {
        get {
            return self.frame.origin.x + self.frame.size.width
        } set {
            
        }
    }
    
    /// Shortcut for frame.origin.y + frame.size.height
    var bottom : CGFloat {
        get {
            return self.frame.origin.y + self.frame.size.height
        } set {
            let frame = self.frame
            self.frame = frame
        }
    }
    
    /// Shortcut for center.x
    var centerX: CGFloat {
        get {
            return self.center.x
        } set {
            var center = self.center
            center.x = newValue
            self.center = center
        }
    }
    
    /// Shortcut for center.y
    var centerY: CGFloat {
        get {
            return self.center.y
        } set {
            var center = self.center
            center.y = newValue
            self.center = center
        }
    }
    
    /// Shortcut for frame.origin
    var origin: CGPoint {
        get {
            return self.frame.origin
        } set {
            var frame = self.frame
            frame.origin = newValue
            self.frame = frame
        }
    }
    
    /// Shortcut for frame.size
    var size: CGSize {
        get {
            return self.frame.size
        } set {
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
    }
}
