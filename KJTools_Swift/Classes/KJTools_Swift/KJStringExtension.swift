//
//  KJStringExtension.swift
//  PickerView
//
//  Created by Kaden Jack on 2019/2/27.
//  Copyright © 2019 Kaden Jack. All rights reserved.
//  https://www.jianshu.com/p/a9ab7d343baf

import UIKit


// 下标截取任意位置的便捷方法
extension String {
    
    public var length: Int {
        return self.count
    }
    
    public subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }
    
    public func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }
    
    public func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }
    
    public subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)), upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
    
}


//MARK: - 获取文本高度(宽度)
//extension String {
//
//
//    /// 获取字符串尺寸--私有方法
//    ///
//    /// - Parameters:
//    ///   - str: 字符串
//    ///   - attriStr: 富文本
//    ///   - font: 字体大小
//    ///   - w: 宽度
//    ///   - h: 高度
//    /// - Returns: 宽、高
//    private func getNormalStrSize(str: String? = nil, attriStr: NSMutableAttributedString? = nil, font: CGFloat, w: CGFloat, h: CGFloat) -> CGSize {
//        if str != nil {
//            let strSize = (str! as NSString).boundingRect(with: CGSize(width: w, height: h), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue): UIFont.systemFont(ofSize: font)], context: nil).size
//            return strSize
//        }
//
//        if attriStr != nil {
//            let strSize = attriStr!.boundingRect(with: CGSize(width: w, height: h), options: .usesLineFragmentOrigin, context: nil).size
//            return strSize
//        }
//        return CGSize.zero
//    }
//
//
//    /// 获取富文本字符串高度
//    ///
//    /// - Parameters:
//    ///   - attriStr: 富文本
//    ///   - strFont: 字体大小
//    ///   - w: 宽度
//    /// - Returns: 高度
//    public func getAttributedStrH(attriStr: NSMutableAttributedString, strFont: CGFloat, w: CGFloat) -> CGFloat {
//        return getNormalStrSize(attriStr: attriStr, font: strFont, w: w, h: CGFloat.greatestFiniteMagnitude).height
//    }
//
//
//
//    /// 获取富文本字符串宽度W
//    ///
//    /// - Parameters:
//    ///   - attriStr: 富文本
//    ///   - strFont: 字体大小
//    ///   - h: 高度
//    /// - Returns: 宽度
//    public func getAttributedStrW(attriStr: NSMutableAttributedString, strFont: CGFloat, h: CGFloat) -> CGFloat {
//        return getNormalStrSize(attriStr: attriStr, font: strFont, w: CGFloat.greatestFiniteMagnitude, h: h).width
//    }
//
//
//    /// 获取字符串高度H
//    ///
//    /// - Parameters:
//    ///   - str: 字符串
//    ///   - strFont: 字体大小
//    ///   - w: 宽度
//    /// - Returns: 高度
//    public func getNormalStrH(str: String, strFont: CGFloat, w: CGFloat) -> CGFloat {
//        return getNormalStrSize(str: str, font: strFont, w: w, h: CGFloat.greatestFiniteMagnitude).height
//    }
//
//
//    /// 获取字符串宽度W
//    ///
//    /// - Parameters:
//    ///   - str: 字符串
//    ///   - strFont: 字体大小
//    ///   - h: 高度
//    /// - Returns: 宽度
//    public func getNormalStrW(str: String, strFont: CGFloat, h: CGFloat) -> CGFloat {
//        return getNormalStrSize(str: str, font: strFont, w: CGFloat.greatestFiniteMagnitude, h: h).width
//    }
//
//
//
//    //    /// 获取文本高度
//    //    ///
//    //    /// - Parameters:
//    //    ///   - font: 字体大小
//    //    ///   - maxWidth: 最大宽度
//    //    public func getTextHeight(WithFont font: UIFont = UIFont.systemFont(ofSize: 15), maxWidth: CGFloat) -> CGFloat {
//    //        let normalText: String = self
//    //        let size = CGSize.init(width: maxWidth, height: 1000)
//    //        let dic = NSDictionary(object: font, forKey: NSAttributedString.Key.font as NSCopying)
//    //        let stringSize = normalText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedString.Key : Any], context:nil).size
//    //        return stringSize.height
//    //    }
//
//
//    /// 获取文本宽度
//    ///
//    /// - Parameters:
//    ///   - font: 字体大小
//    ///   - maxHeight: 最大高度
//    //    public func getTextWidth(WithFont font: UIFont = UIFont.systemFont(ofSize: 15), maxHeight: CGFloat) -> CGFloat {
//    //        let normalText: String = self
//    //        let size = CGSize(width: 1000, height: maxHeight)
//    //        let dic = NSDictionary(object: font, forKey: NSAttributedString.Key.font as NSCopying)
//    //        let stringSize = normalText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedString.Key : Any], context:nil).size
//    //        return stringSize.width
//    //    }
//
//}

public struct AttributedModel {
    /// 默认文本
    var normalString: String = ""
    /// 默认字体大小
    var normalFontSize: CGFloat = 15.0
    /// 默认字体颜色
    var normalTextColor: UIColor = UIColor.white
    /// 高亮文本
    var highLightString: String = ""
    /// 高亮字体大小
    var highLightFontSize: CGFloat = 15.0
    /// 高亮字体颜色
    var highLightTextColor: UIColor = UIColor.white
}

/// 富文本
//extension NSMutableAttributedString {
//
//    public static func attributedString(_ model: AttributedModel) -> NSMutableAttributedString {
//        //定义富文本即有格式的字符串
//        let attributedStrM : NSMutableAttributedString = NSMutableAttributedString()
//        let strings = model.normalString.components(separatedBy: model.highLightString)
//
//        for i in 0..<strings.count {
//            let item = strings[i]
//            let dict = [NSAttributedString.Key.font.rawValue: UIFont.systemFont(ofSize: model.normalFontSize),
//                        NSAttributedString.Key.foregroundColor: model.normalTextColor] as [AnyHashable : NSObject]
//
//            let content = NSAttributedString(string: item, attributes: (dict as! [NSAttributedString.Key : Any]))
//            attributedStrM.append(content)
//
//            if i != strings.count - 1 {
//                let dict1 = [NSAttributedString.Key.font.rawValue: UIFont.systemFont(ofSize: model.highLightFontSize),
//                             NSAttributedString.Key.foregroundColor: model.highLightTextColor] as [AnyHashable : NSObject]
//
//                let content2 = NSAttributedString(string: model.highLightString,
//                                                  attributes: (dict1 as! [NSAttributedString.Key : Any]))
//                attributedStrM.append(content2)
//            }
//        }
//        return attributedStrM
//    }
//
//}
