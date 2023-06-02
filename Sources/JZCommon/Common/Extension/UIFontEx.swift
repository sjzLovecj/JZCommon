//
//  UIFontEx.swift
//  Demo
//
//  Created by S JZ on 2022/11/1.
//

import Foundation
import UIKit

public extension UIFont {
    @discardableResult
    @objc static func font(_ size: CGFloat) -> UIFont {
        systemFont(ofSize: size)
    }
    
    @discardableResult
    @objc static func medium(_ size: CGFloat) -> UIFont {
        systemFont(ofSize: size, weight: .medium)
    }
    
    @discardableResult
    @objc static func semibold(_ size: CGFloat) -> UIFont {
        systemFont(ofSize: size, weight: .semibold)
    }
    
    @discardableResult
    @objc static func bold(_ size: CGFloat) -> UIFont {
        systemFont(ofSize: size, weight: .bold)
    }
    
    @discardableResult
    @objc static func heavy(_ size: CGFloat) -> UIFont {
        systemFont(ofSize: size, weight: .heavy)
    }
    
    @discardableResult
    @objc static func black(_ size: CGFloat) -> UIFont {
        systemFont(ofSize: size, weight: .black)
    }
    
    @discardableResult
    @objc static func light(_ size: CGFloat) -> UIFont {
        systemFont(ofSize: size, weight: .light)
    }
    
    @discardableResult
    @objc static func thin(_ size: CGFloat) -> UIFont {
        systemFont(ofSize: size, weight: .thin)
    }
}

// 使用 PingFangSC 字体
public extension UIFont {
    static func scFont(_ size: CGFloat) -> UIFont {
        scFontWeight(size, weight: .regular)
    }
    
    static func scMedium(_ size: CGFloat) -> UIFont {
        scFontWeight(size, weight: .medium)
    }
    
    static func scBold(_ size: CGFloat) -> UIFont {
        scFontWeight(size, weight: .bold)
    }
    
    static func scFontWeight(_ size: CGFloat, weight: Weight) -> UIFont {
        var name = ""
        switch weight {
        case .ultraLight:
            name = "PingFangSC-Ultralight"
        case .thin:
            name = "PingFangSC-Thin"
        case .light:
            name = "PingFangSC-Light"
        case .regular:
            name = "PingFangSC-Regular"
        case .medium:
            name = "PingFangSC-Medium"
        case .semibold:
            name = "PingFangSC-Semibold"
        case .bold:
            name = "PingFangSC-Bold"
        case .heavy:
            name = "PingFangSC-Heavy"
        default:
            name = "PingFangSC-Regular"
        }
        return UIFont(name: name, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}

