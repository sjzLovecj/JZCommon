//
//  SJZAppConfiguration.swift
//  SJZ
//
//  Created by S JZ on 2022/10/20.
//

import UIKit
import SwiftUI

public enum SJZColorSchemeType: Int {
    case system
    case light
    case dark
}

public struct SJZColorScheme {
    static let shared = SJZColorScheme()
    
    // App的颜色类型，默认为跟随系统
    @AppStorage("colorSchemeType") var colorSchemeType: SJZColorSchemeType = .system
    @Environment(\.colorScheme) var colorSchemd: ColorScheme
    
    // 判断是否为暗黑模式
    public func isDark() -> Bool {
        if colorSchemeType == .system {
            return colorSchemd == .dark
        }else if colorSchemeType == .dark {
            return true
        }
        
        return false
    }
    
    // 设置显示的模式
    public func changeColorSchemd(_ colorSchemeType: SJZColorSchemeType) {
        // 存储类型不同，就赋值
        if self.colorSchemeType != colorSchemeType {
            self.colorSchemeType = colorSchemeType
        }
        
        // iPhone只有一个窗口，所以只设置keyWindow就可以
        // iPad和Mac可能存在多个窗口，需要讲所有 UIWindowScene中所有的窗口都设置
        if UIDevice.current.userInterfaceIdiom == .phone {
            if colorSchemeType == .system {
                keyWindow?.overrideUserInterfaceStyle = .unspecified
            }else if colorSchemeType == .light {
                keyWindow?.overrideUserInterfaceStyle = .light
            }else if colorSchemeType == .dark {
                keyWindow?.overrideUserInterfaceStyle = .dark
            }
        }else {
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
}
