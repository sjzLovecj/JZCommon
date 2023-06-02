//
//  LaunchScreenChange.swift
//  JZCommonExample
//
//  Created by S JZ on 2023/6/2.
//

import UIKit

/// 场景：当更换LaunchScreen.storyboard中的图片时，经常会遇到黑屏、白屏、图片更新等问题
/// 原因是：当用户下载或更新App，会在沙盒中缓存一张开屏图片，每次加载都回去加载该图片，有时：重启手机会变好，有时则不会
/// 解决办法：（跟换过两次，暂时没发现问题）
/// 1. 重新在 .xcassets 中建立一个 Image Set，并取一个新的名字
/// 2. 更换在 LaunchScreen.storyboard 中的图片
/// 3. 在AppDelegate的初始化方法中，调用 removeLaunchScreenCacheIfNeeded() 方法
public struct LaunchScreenChange {

    public static func removeLaunchScreenCacheIfNeeded() {
        let filePath = String(format: "%@/Library/SplashBoard/Snapshots/%@ - {DEFAULT GROUP}/", NSHomeDirectory(), Define.appBundleId)
        
        if FileManager.default.fileExists(atPath: filePath),
            let fileArr = try? FileManager.default.contentsOfDirectory(atPath: filePath),
            !fileArr.isEmpty,
            let imageName = fileArr.first {

            // 根据路径删除原来图片
            try? FileManager.default.removeItem(atPath: String(format: "%@%@", filePath, imageName))
            
            // 将新图片写入沙盒中
            if #available(iOS 16.0, *) {
                try? imageFromLaunchScreen()?.pngData()?.write(to: URL(filePath: String(format: "%@%@", filePath, imageName)))
            } else {
                try? imageFromLaunchScreen()?.pngData()?.write(to: URL(fileURLWithPath: String(format: "%@%@", filePath, imageName)))
            }
        }
    }

    private static func imageFromLaunchScreen() -> UIImage? {
        guard let storyBoardName = Define.infoDict?["UILaunchStoryboardName"] as? String,
              let launchView = UIStoryboard(name: storyBoardName, bundle: nil).instantiateInitialViewController()?.view
        else { return nil }
        
        let containerWindow = UIWindow(frame: Define.windowScene?.screen.bounds ?? .zero)
        launchView.frame = containerWindow.bounds
        containerWindow.addSubview(launchView)
        containerWindow.layoutIfNeeded()

        return launchView.shotImageFromView()
    }
}
