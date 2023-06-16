//
//  StringEx.swift
//  
//
//  Created by S JZ on 2022/11/8.
//

import Foundation

// 将String转换成NSString，做一些NSString简单的操作
public extension String {
    
    // MARK: - 将字符串转为字符型
    var doubleValue: Double {
        (self as NSString).doubleValue
    }
    
    var floatValue: Float {
        (self as NSString).floatValue
    }
    
    var intValue: Int {
        (self as NSString).integerValue
    }
    
    var boolValue: Bool {
        (self as NSString).boolValue
    }
    
    // MARK: - 获取子字符串，通过转为NSString
    @discardableResult
    func subString(form: Int) -> String {
        return (self as NSString).substring(from: form)
    }
    
    @discardableResult
    func subString(to: Int) -> String {
        return (self as NSString).substring(to: to)
    }
    
    @discardableResult
    func subString(with: NSRange) -> String {
        return (self as NSString).substring(with: with)
    }
    
    // MARK: - 下标
    subscript(bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        let str = self[start..<end]
        return String(str)
    }
    
    subscript(bounds: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        let str = self[start...end]
        return String(str)
    }
    
    subscript(index: Int) -> String {
        let character = self[self.index(startIndex, offsetBy: index)]
        return String(character)
    }
    
}

public extension String {
    func localizable() -> String {
        return Bundle.main.localizedString(forKey: self, value: nil, table: nil)
    }
}
