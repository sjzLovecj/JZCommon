//
//  JZColorScheme.swift
//  JZCommonExample
//
//  Created by S JZ on 2023/6/1.
//

import SwiftUI

public enum ColorSchemeType: Int {
    // 跟随系统
    case system = 0
    // 浅色模式
    case light = 1
    // 暗黑模式
    case dark = 2
}

/// 更改App主题颜色
public struct JZColorScheme {
    public static let shared: JZColorScheme = JZColorScheme()
    
    // 使用AppStorage将 colorSchemeType 保存在UseDefaults中
    @AppStorage("colorSchemeType") public private(set) var colorSchemeType: ColorSchemeType = .system
    
    // 判断是否为暗黑模式
    public var isDark: Bool {
        if colorSchemeType == .system {
            return UITraitCollection.current.userInterfaceStyle == .dark
        }else if colorSchemeType == .dark {
            return true
        }
        return false
    }
    
    /// 更改App主题颜色
    /// - Parameter type: ColorSchemeType类型
    public func changeColorScheme(_ type: ColorSchemeType) {
        guard colorSchemeType != type else { return }
        colorSchemeType = type
        
        let windowScenes = UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }
        windowScenes.forEach { windowScene in
            windowScene.windows.forEach { window in
                if colorSchemeType == .system {
                    window.overrideUserInterfaceStyle = .unspecified
                }else if colorSchemeType == .light {
                    window.overrideUserInterfaceStyle = .light
                }else if colorSchemeType == .dark {
                    window.overrideUserInterfaceStyle = .dark
                }
            }
        }
    }
}


