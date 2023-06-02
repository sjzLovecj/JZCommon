//
//  ExchangeMethod.swift
//  JZCommonExample
//
//  Created by S JZ on 2023/6/2.
//

import UIKit

public class ExchangeMethod {
    /// 交换方法
    /// - Parameters:
    ///   - classType: 交换方法的类
    ///   - originalSelector: 原来方法
    ///   - swizzledSelector: 用来交换的方法
    public static func exchangeMethod(_ classType: AnyClass, originalSelector: Selector, swizzledSelector: Selector) {
        guard let originalMethod = class_getInstanceMethod(classType, originalSelector) else {
            return
        }
        
        guard let swizzledMethod = class_getInstanceMethod(classType, swizzledSelector) else {
            return
        }

        // 在进行 Swizzling 的时候,需要用 class_addMethod 先进行判断一下原有类中是否有要替换方法的实现
        let didAddMethod: Bool = class_addMethod(classType, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
        
        // 如果 class_addMethod 返回 yes,说明当前类中没有要替换方法的实现,所以需要在父类中查找,这时候就用到 method_getImplemetation 去获取 class_getInstanceMethod 里面的方法实现,然后再进行 class_replaceMethod 来实现 Swizzing
        if didAddMethod {
            class_replaceMethod(classType, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }
}

public extension NSObject {
    /// 交换方法
    /// - Parameters:
    ///   - originalSelector: 原来方法
    ///   - swizzledSelector: 用来交换的方法
    static func exchangeMethod(originalSelector: Selector, swizzledSelector: Selector) {
        ExchangeMethod.exchangeMethod(self.classForCoder(), originalSelector: originalSelector, swizzledSelector: swizzledSelector)
    }
}

