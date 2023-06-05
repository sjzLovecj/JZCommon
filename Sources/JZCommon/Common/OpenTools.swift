//
//  OpenTools.swift
//  JZCommonExample
//
//  Created by S JZ on 2023/6/5.
//

import UIKit
import SafariServices
import StoreKit

public struct OpenTools {
    
    /// 在应用内根据URL打开浏览器
    /// - Parameter url: 需要浏览器打开的URL
    public static func openSafari(_ url: URL) {
        let safariVC = SFSafariViewController(url: url)
        // 应用内跳转Safari
        Define.currentController().present(safariVC, animated: true)
    }
    
    /// 在应用内根据identifier打开应用
    /// - Parameter identifier: 需要打开应用的identifier
    public static func openAppStore(_ identifier: String) {
        let storeVC = SKStoreProductViewController()
        
        let param = [SKStoreProductParameterITunesItemIdentifier : identifier]
        storeVC.loadProduct(withParameters: param) { success, error in
            
        }
        
        // swiftUI appStoreOverlay
        Define.currentController().present(storeVC, animated: true)
    }
    
    /// 弹出评价窗口
    public static func openEvaluate() {
        if let scene = Define.windowScene {
            SKStoreReviewController.requestReview(in: scene)
        }
    }
    
    /// 分享App给朋友
    /// - Parameter url: App在商店中的链接
    public static func shardApp(_ url: String) {
        let activityVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        activityVC.completionWithItemsHandler = { activityType, completed, returendItem, error in
            
        }
        Define.currentController().present(activityVC, animated: true)
    }
    
    /// 去本App设置
    public static func openSetting() {
        if let url = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    /// 打开系统设置页面
    /// - Parameter pref: 系统设置pref，例如PASSCODE
    public static func openSystemSetting(_ pref: String) {
        if let url = URL(string: "App-prefs:\(pref)"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url) { success in
                print(success)
            }
        }
    }

}
