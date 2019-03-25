//
//  KJViewExtension.swift
//  PickerView
//
//  Created by Kaden Jack on 2019/2/23.
//  Copyright © 2019 Kaden Jack. All rights reserved.
//

// https://github.com/ChocolatesChen/CardView
// https://github.com/cdcyd/CCViewEffects

import UIKit

/// 圆角
private var privateRadius: CGFloat      = 0.0
/// 圆角方向
private var privateCorner: UIRectCorner = UIRectCorner.allCorners
/// 边框颜色
private var privateBorderColor: UIColor = UIColor.clear
/// 边框宽度
private var privateBorderWidth: CGFloat = 0.0
/// 阴影颜色
private var privateShadowColor: UIColor = .clear
/// 阴影偏移值
private var privateShadowOffset: CGSize = .zero
/// 阴影扩散范围
private var privateShadowRadius: CGFloat = 0.0
/// 阴影的透明度
private var privateshadowOpacity: CGFloat = 0.0
///
private var privateBezierPath : UIBezierPath!
///
private var privateViewBounds : CGRect = CGRect.zero
///// 阴影空视图，只在有圆角的时候使用
private var shadowBackgroundView: UIView!

//MARK: - 视图圆角、边框、阴影
extension UIView {
    
    
    /// 圆角半径(默认0.0)
    ///
    /// - Parameter radius: 圆角
    public func conrnerRadius(_ radius: CGFloat = 0.0) -> UIView {
        privateRadius = radius
        return self
    }
    
    
    /// 圆角方向(默认所有圆角)
    ///
    /// - Parameter corner: 圆角方向
    public func conrnerCorner(_ corner: UIRectCorner = .allCorners) -> UIView {
        privateCorner = corner
        return self
    }
    
    
    /// 边框颜色(默认黑色)
    ///
    /// - Parameter color: 边框颜色
    public func borderColor(_ color: UIColor = .black) -> UIView {
        privateBorderColor = color
        return self
    }
    
    
    /// 边框宽度(默认0)
    ///
    /// - Parameter borderWidth: 边框宽度
    public func borderWidth(_ borderWidth: CGFloat = 0.00) -> UIView {
        privateBorderWidth = borderWidth
        return self
    }
    
    
    /// 阴影颜色(默认黑色)
    ///
    /// - Parameter shadowColor: 阴影颜色
    public func shadowColor(_ shadowColor: UIColor = .clear) -> UIView {
        privateShadowColor = shadowColor
        return self
    }
    
    
    /// 阴影偏移值(默认无偏移)
    ///
    /// - Parameter shadowOffset: 阴影偏移值
    public func shadowOffset(_ shadowOffset: CGSize = .zero) -> UIView {
        privateShadowOffset = shadowOffset
        return self
    }
    
    
    /// 阴影扩散范围(默认0)
    ///
    /// - Parameter shadowRadius: 阴影扩散范围
    public func shadowRadius(_ shadowRadius: CGFloat = 0.0) -> UIView {
        privateShadowRadius = shadowRadius
        return self
    }
    
    
    /// 阴影的透明度(默认为0)
    ///
    /// - Parameter shadowOpacity: 阴影的透明度
    public func shadowOpacity(_ shadowOpacity: CGFloat = 0.0) -> UIView {
        privateshadowOpacity = shadowOpacity
        return self
    }
    
    
    /// 贝塞尔路径 默认 nil (有值时，radius属性将失效)
    ///
    /// - Parameter path: 路径
    public func bezierPath(_ path: UIBezierPath) -> UIView {
        privateBezierPath = path
        return self
    }
    
    /// 为其他视图添加(设置圆角时，会去获取视图的bounds属性，如果此时获取不到，则需要传入该参数，默认为 nil，如果传入该参数，则不会去回去视图的bounds属性了)
    ///
    /// - Parameter rect: 视图Bounds
    public func viewBounds(_ rect: CGRect = .zero) -> UIView {
        privateViewBounds = rect
        return self
    }
    
    
    /// 显示
    ///
    public func showVisual() -> Void {
        /// 阴影或圆角、边框
        addShadowAndRadius()
    }
    
    /// 清空所有设置
    public func clerVisual () {
        
        self.layer.removeFromSuperlayer()
        
        /// 恢复所有设置
        /// 圆角
        privateRadius = 0.0
        /// 圆角方向
        privateCorner = UIRectCorner.allCorners
        /// 边框颜色
        privateBorderColor = UIColor.clear
        /// 边框宽度
        privateBorderWidth = 0.0
        /// 阴影颜色
        privateShadowColor = .clear
        /// 阴影偏移值
        privateShadowOffset = .zero
        /// 阴影扩散范围
        privateShadowRadius = 0.0
        /// 阴影的透明度
        privateshadowOpacity = 0.0
        ///
        privateViewBounds = CGRect.zero
        
        self.layer.masksToBounds  = false
        self.layer.cornerRadius   = 0.0
        self.layer.borderWidth    = 0.0
        self.layer.borderColor    = UIColor.clear.cgColor
        self.layer.shadowOpacity  = 0.0
        self.layer.shadowPath     = nil
        self.layer.shadowRadius   = 0.0
        self.layer.shadowColor    = UIColor.clear.cgColor
        self.layer.shadowOffset   = CGSize.zero
        self.layer.mask           = nil
    }
    
    
    /// 添加阴影和圆角
    fileprivate func addShadowAndRadius () {
        
        let shadowView = self
        // 同时存在阴影和圆角(目前仅支持全圆角)
        if privateRadius > 0.0 && privateshadowOpacity > 0.0 {
            // 阴影
            shadowView.layer.masksToBounds = false
            // 边框宽度
            shadowView.layer.borderWidth   = privateBorderWidth
            // 边框颜色
            shadowView.layer.borderColor   = privateBorderColor.cgColor
            
            shadowView.layer.cornerRadius  = privateRadius
            shadowView.layer.shadowOpacity = Float(privateshadowOpacity)
            shadowView.layer.shadowRadius  = privateShadowRadius
            shadowView.layer.shadowOffset  = privateShadowOffset
            shadowView.layer.shadowColor   = privateShadowColor.cgColor
            
            return
        }
        // 圆角
        if (privateRadius > 0) {
            let maskPath = drawBezierPath()
            let maskLayer = CAShapeLayer()
            maskLayer.frame = drawBounds()
            maskLayer.path = maskPath.cgPath
            
            // 填充颜色
            if (self.backgroundColor != nil) {
                maskLayer.fillColor = self.backgroundColor?.cgColor
            } else {
                maskLayer.fillColor = UIColor.clear.cgColor
            }
            // 边线颜色
            maskLayer.strokeColor = privateBorderColor.cgColor
            // 边线宽度
            maskLayer.lineWidth = privateBorderWidth
            
            shadowView.layer.mask = maskLayer
        }
        // 阴影
        shadowView.layer.masksToBounds = false
        shadowView.layer.shadowOpacity = Float(privateshadowOpacity)
        shadowView.layer.shadowRadius  = privateShadowRadius
        shadowView.layer.shadowOffset  = privateShadowOffset
        shadowView.layer.shadowColor   = privateShadowColor.cgColor
    }
    
    
    fileprivate func drawBezierPath() -> UIBezierPath {
        if privateBezierPath != nil {
            return privateBezierPath
        }
        let path = UIBezierPath(roundedRect: drawBounds(), byRoundingCorners: privateCorner, cornerRadii: CGSize(width: privateRadius, height: privateRadius))
        return path
    }
    
    
    fileprivate func drawBounds () -> CGRect {
        // 1.如果传入了大小，则直接返回
        if privateViewBounds != .zero {
            return privateViewBounds
        }
        // 2.获取在自动布局时的视图大小
        if self.superview != nil {
            self.superview?.layoutIfNeeded()
        }
        return self.bounds
    }
    
    /***
     /// 设置视图(圆角 + 边框)
     ///
     /// - Parameters:
     ///   - ConrnerRadius: 圆角大小(默认为0)
     ///   - conrnerCorner: 圆角方向(默认为全部方向,多个方向为 [UIRectCorner.topLeft, UIRectCorner.topRight] )
     ///   - borderWidth: 边框宽度(默认为0)
     ///   - borderColor: 边框颜色
     func setShowVisual(With conrnerRadius: CGFloat = 0.0 ,conrnerCorner:UIRectCorner = .allCorners ,borderWidth:CGFloat = 0.0 ,borderColor:UIColor = UIColor.black) {
     
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
     */
    
}


//MARK: - UIView frame
public protocol MySize {}

extension UIView: MySize {}

extension MySize where Self: UIView {
    
    /// Shortcut for frame.origin.x
    public var x : CGFloat {
        get {
            return self.frame.origin.x
        } set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    
    /// Shortcut for frame.origin.y
    public var y : CGFloat {
        get {
            return self.frame.origin.y
        } set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    /// Shortcut for frame.size.width
    public var width: CGFloat {
        get {
            return self.frame.width
        } set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }
    
    /// Shortcut for frame.size.height
    public var height: CGFloat {
        get {
            return self.frame.height
        } set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
    
    /// Shortcut for frame.origin.x + frame.size.width
    public var right : CGFloat {
        get {
            return self.frame.origin.x + self.frame.size.width
        } set {
            
        }
    }
    
    /// Shortcut for frame.origin.y + frame.size.height
    public var bottom : CGFloat {
        get {
            return self.frame.origin.y + self.frame.size.height
        } set {
            let frame = self.frame
            self.frame = frame
        }
    }
    
    /// Shortcut for center.x
    public var centerX: CGFloat {
        get {
            return self.center.x
        } set {
            var center = self.center
            center.x = newValue
            self.center = center
        }
    }
    
    /// Shortcut for center.y
    public var centerY: CGFloat {
        get {
            return self.center.y
        } set {
            var center = self.center
            center.y = newValue
            self.center = center
        }
    }
    
    /// Shortcut for frame.origin
    public var origin: CGPoint {
        get {
            return self.frame.origin
        } set {
            var frame = self.frame
            frame.origin = newValue
            self.frame = frame
        }
    }
    
    /// Shortcut for frame.size
    public var size: CGSize {
        get {
            return self.frame.size
        } set {
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
    }
}
