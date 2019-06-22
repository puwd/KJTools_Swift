//
//  KJDateObject.swift
//  KJTools_Swift
//
//  Created by Kaden Jack on 2019/6/5.
//  https://www.jianshu.com/p/652670916ecc

import UIKit


public class KJDateObject: NSObject {
    
    
    /// 获取当前系统时间
    ///
    /// - Returns: 当前时间
    public class func currentTime(_ dateFormat: String = "YYYY-MM-dd HH:mm:ss") -> String {
        let dateformatter = DateFormatter()
        /// 自定义时间格式
        dateformatter.dateFormat = dateFormat
        /// GMT时间 转字符串，直接是系统当前时间
        return dateformatter.string(from: Date())
    }
    
    
    /// 获取时间戳
    ///
    /// - Returns: 时间戳
    public class func timeStamp(_ date: Date = Date()) -> TimeInterval {
        /// GMT时间转时间戳 没有时差，直接是系统当前时间戳
        return date.timeIntervalSince1970
    }
    
    
    /// 时间戳 -> 日期
    ///
    /// - Parameter timeStamp: 时间戳
    /// - Returns: 日期
    public class func timeStampToString(_ timeStamp: TimeInterval,_ dateFormat: String = "YYYY-MM-dd HH:mm:ss") -> String {
        let date = Date(timeIntervalSince1970: timeStamp)
        let dateformatter = DateFormatter()
        /// 自定义时间
        dateformatter.dateFormat = dateFormat
        return dateformatter.string(from: date)
    }
    
    
    /// 字符串 -> 时间戳
    ///
    /// - Parameters:
    ///   - time: 时间(字符串)
    ///   - dateFormat: 时间格式
    /// - Returns: 时间戳
    public class func stringToTimeStamp(_ time: String,_ dateFormat: String = "YYYY-MM-dd HH:mm:ss") -> TimeInterval {
        let dateformatter = DateFormatter()
        // 自定义时间格式
        dateformatter.dateFormat = dateFormat
        let date = dateformatter.date(from: time)
        return (date?.timeIntervalSince1970)!
    }
    
    
    /// 时间比较
    ///
    /// - Parameters:
    ///   - date1: 时间 1
    ///   - date2: 时间 2
    /// - Returns: 1(date1 小于 date2) ; 0(相等) ; -1(date1 大于 date2)
    public class func ccompareDate(_ date1: Date, date date2: Date) -> Int {
        let result = date1.compare(date2)
        switch result {
        case .orderedDescending:
            return 1 /// date1 小于 date2
        case .orderedSame:
            return 0 /// 相等
        case .orderedAscending:
            return -1 /// date1 大于 date2
        }
    }
    
}
