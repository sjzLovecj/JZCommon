//
//  Define.swift
//  Demo
//
//  Created by S JZ on 2022/11/1.
//

import Foundation
import UIKit

// MARK: - 获取屏幕宽高
public var screenWidth: CGFloat {
    (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.screen.bounds.width ?? 0
}
public var screenHeight: CGFloat {
    (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.screen.bounds.height ?? 0
}

// 用于判断是否为刘海屏
public var isPhoneX: Bool {
    statusBarHeight > 30
}

// MARK: - 屏幕宽高比例
public let defaultWidth = 375
public let fitWidth = screenWidth / 375

// MARK: - 屏幕像素比例
public let scare = UIScreen.main.scale
public let lineHeight = CGFloat(scare >= 1 ? 1 / scare : 1)

// 状态栏高度
public var statusBarHeight: CGFloat {
    keyWindow?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
}

// navigationBar高度
public var navigationBarHeight: CGFloat {
    UINavigationController().navigationBar.frame.size.height
}

// 导航栏高度：状态栏 + navigationBar高度
public var navigationHeight: CGFloat {
    statusBarHeight + navigationBarHeight
}

// 底部Home条的高度：刘海屏：34，非刘海屏：0
public var bottomHomeHeight: CGFloat {
    keyWindow?.safeAreaInsets.bottom ?? 0
}

// 动态获取TabBar的高度
public var tabBarHeight: CGFloat {
    UITabBarController().tabBar.frame.size.height
}

// 底部tabBar + home条高度
public var tabBarAndHomeHeight: CGFloat {
    bottomHomeHeight + tabBarHeight
}

// MARK: 获取KeyWindow
public var keyWindow: UIWindow? {
    // iOS13.0 之前获取方式
    // UIApplication.shared.keyWindow
    
    let windowScreen = UIApplication.shared.connectedScenes.first as? UIWindowScene
    return windowScreen?.windows.first { key in
        key.isKeyWindow
    }
}
