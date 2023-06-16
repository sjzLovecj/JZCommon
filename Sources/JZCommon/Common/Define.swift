//
//  Define.swift
//  Demo
//
//  Created by S JZ on 2022/11/1.
//

import Foundation
import UIKit

public class Define {
//    public static let shared: Define = Define()
    
    // 获取 windowScene
    public static var windowScene: UIWindowScene? { UIApplication.shared.connectedScenes.first as? UIWindowScene }
    // MARK: 获取KeyWindow
    // iOS13.0 之前获取方式
    // UIApplication.shared.keyWindow
    public static var keyWindow: UIWindow? { windowScene?.windows.first { $0.isKeyWindow } }
    
    // 获取顶部 topWindow
    public static var topWindow: UIWindow? { windowScene?.windows.last }
    
    // MARK: - 获取屏幕宽高
    // 屏幕宽度
    public static var screenWidth: CGFloat { windowScene?.screen.bounds.width ?? 0 }
    // 屏幕高度
    public static var screenHeight: CGFloat { windowScene?.screen.bounds.height ?? 0 }

    // 用于判断是否为刘海屏
    public static var isPhoneX: Bool { statusBarHeight > 30 }

    // MARK: - 屏幕宽高比例
    // 设置默认宽度为375.0
    public static let defaultWidth: CGFloat = 375.0
    // 当前屏幕 与 默认宽度 比利
    public static var fitWidth: CGFloat { screenWidth / defaultWidth }

    // MARK: - 屏幕像素比例
    public static let scare: CGFloat = windowScene?.screen.scale ?? 1
    // 根据屏幕像素比例，获取横线高度
    public static var lineHeight: CGFloat { CGFloat(scare >= 1 ? 1 / scare : 1) }

    // 状态栏高度
    public static var statusBarHeight: CGFloat { keyWindow?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0 }

    // navigationBar高度
    public static var navigationBarHeight: CGFloat { UINavigationController().navigationBar.frame.size.height }

    // 导航栏高度：状态栏 + navigationBar高度
    public static var navigationHeight: CGFloat { statusBarHeight + navigationBarHeight }

    // 底部Home条的高度：刘海屏：34，非刘海屏：0
    public static var bottomSafeHeight: CGFloat { keyWindow?.safeAreaInsets.bottom ?? 0 }

    // 动态获取TabBar的高度
    public static var tabBarHeight: CGFloat { UITabBarController().tabBar.frame.size.height }

    // 底部tabBar + home条安全区高度
    public static var tabBarAndBottomSafeHeight: CGFloat { bottomSafeHeight + tabBarHeight }
}

// 获取currentController、currentNavigation
extension Define {
    
    // 获取当前Controller
    @discardableResult
    public static func currentController() -> UIViewController {
        if let currentController = getCurrent() { return currentController }
        return UIViewController()
    }
    
    // 获取当前控制器
    @discardableResult
    public static func currentNavigation() -> UINavigationController? {
        currentController().navigationController
    }
    
    // 获取可用的导航控制器
    @discardableResult
    public static func getNavigation(controller: UIViewController? = nil) -> UINavigationController? {
        if let navController = controller as? UINavigationController {
            return navController
        }else if let navController = controller?.navigationController {
            return navController
        }
        return currentNavigation()
    }
    
    // 获取current
    @discardableResult
    public static func getCurrent(_ controller: UIViewController? = keyWindow?.rootViewController) -> UIViewController? {
        if let naviController = controller as? UINavigationController,
            let visibleController = naviController.visibleViewController { // 导航栏
            return getCurrent(visibleController)
        } else if let tabbarController = controller as? UITabBarController,
                    let selectedController = tabbarController.selectedViewController { // TabBar
            return getCurrent(selectedController)
        } else if let presentedController = controller?.presentedViewController {   // 是否有模态试图
            return getCurrent(presentedController)
        }
        return controller
    }
}

// 获取App各种基础信息
extension Define {

    // 获取App信息
    public static var infoDict: [String : Any]? { Bundle.main.infoDictionary }
    
    // 获取app的版本号
    public static var appVersion: String { (infoDict?["CFBundleShortVersionString"] as? String) ?? "" }
    
    // 获取app的名称
    public static var appName: String { (infoDict?["CFBundleDisplayName"] as? String) ?? "" }
    
    // 获取app的BundleId
    public static var appBundleId: String { Bundle.main.bundleIdentifier ?? "" }
    
    // 获取设备名称，这个是用户自己定义的
    public static var deviceName: String = UIDevice.current.name
    // 系统名称
    public static var systemName: String = UIDevice.current.systemName
    // 系统版本
    public static var systemVersion: String = UIDevice.current.systemVersion
    
    public static var interfaceIdiom: UIUserInterfaceIdiom = UIDevice.current.userInterfaceIdiom
    
    // 钥匙串存储UUID
    
    // 钥匙串存储UDID、ADFA
//    public static var deviceUUID = UIDevice.current.identifierForVendor?.uuidString
    
    
}


