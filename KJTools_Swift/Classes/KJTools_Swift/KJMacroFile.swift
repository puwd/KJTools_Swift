//
//  KJMacroFile.swift
//  PickerView
//
//  Created by Kaden Jack on 2019/2/25.
//  Copyright © 2019 Kaden Jack. All rights reserved.
//

import UIKit

/// 屏幕宽
public let KJ_ScreenWidth = UIScreen.main.bounds.size.width
/// 屏幕高
public let KJ_ScreenHeight = UIScreen.main.bounds.size.height
/// 状态栏高度
public let StatusHeight = UIApplication.shared.statusBarFrame.size.height
/// 是否为IphoneX(IPhone XR、IPhone XS、IPhone Max)
public let IsIphoneX:Bool = StatusHeight == 44 ? true : false
/// 底部间隙
public let BottomSpace = CGFloat(IsIphoneX ? 34 : 0)
/// 获取系统版本
public let iOSVersion = UIDevice.current.systemVersion
/// 屏幕比例尺寸
public let ScreenScale = KJ_ScreenWidth / 750
/// 导航栏高度(刘海屏: 88 ; 无刘海: 64)
public let NavigationHeight = StatusHeight + 44.0
/// 动画时间
public let animateDuration = 0.3






/// log输出
public func printLog<T>(_ message: T, file: String = #file, method: String = #function, line: Int = #line)
{
    #if DEBUG
    print("\n\n file is \((file as NSString).lastPathComponent) \n line is [\(line)] \n method name is \(method) \n content is \(message) \n\n")
    #endif
}
