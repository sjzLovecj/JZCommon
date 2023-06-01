//
//  File.swift
//  
//
//  Created by S JZ on 2022/11/8.
//

import Foundation

extension String {
    
    // MARK: - 将字符串转为字符型
    public var doubleValue: Double {
        (self as NSString).doubleValue
    }
    
    public var floatValue: Float {
        (self as NSString).floatValue
    }
    
    public var intValue: Int {
        (self as NSString).integerValue
    }
    
    public var boolValue: Bool {
        (self as NSString).boolValue
    }
    
    // MARK: - 获取子字符串，通过转为NSString
    @discardableResult
    public func subString(form: Int) -> String {
        return (self as NSString).substring(from: form)
    }
    
    @discardableResult
    public func subString(to: Int) -> String {
        return (self as NSString).substring(to: to)
    }
    
    @discardableResult
    public func subString(with: NSRange) -> String {
        return (self as NSString).substring(with: with)
    }
    
    // MARK: - 下标
    public subscript(bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        let str = self[start..<end]
        return String(str)
    }
    
    public subscript(bounds: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        let str = self[start...end]
        return String(str)
    }
    
    public subscript(index: Int) -> String {
        let character = self[self.index(startIndex, offsetBy: index)]
        return String(character)
    }
    
}
