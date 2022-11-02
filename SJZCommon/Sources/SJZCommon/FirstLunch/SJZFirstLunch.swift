//
//  SJZFirstLunch.swift
//  Demo
//
//  Created by S JZ on 2022/11/1.
//

import Foundation
import SwiftUI

struct SJZFirstLunch {
    static var shared: SJZFirstLunch = SJZFirstLunch()
    
    // 是否为第一次下载，并且第一次启动，默认为是
    @AppStorage("isFirstLunch") var isFirstLunch: Bool = true
    @AppStorage("appVersion") var appVersion: String = ""
    
    // 获取设备信息
    public func getInfoDict() -> [String : Any] {
        guard let infoDict = Bundle.main.infoDictionary else { return [:] }
        return infoDict
    }
    
    // 获取版本信息
    public func getVersion() -> String {
        let infoDict = getInfoDict()
        if let version = infoDict["CFBundleShortVersionString"] as? String, !version.isEmpty {
            return version
        }
        return ""
    }
    
    /// 判断是否第一次，或升级后第一次打开App
    /// - Parameter complete: 第一次安装，重新安装 或者 升级后第一次打开App需要处理的事情，
    ///      isFirstLunch参数：是否为第一次安装，重新安装
    func updateVersion(complete: (_ isFirstLunch: Bool) -> ()) {
        let version = getVersion()
        // version为空，说明获取版本信息错误
        guard !version.isEmpty else { return }
        
        if appVersion.isEmpty {
            // 本次为第一次下载，并第一次启动
            isFirstLunch = false
            
            complete(true)
        }else if version != appVersion {
            // 说明软件版本已经升级
            appVersion = version
            // 处理操作
            complete(false)
        }
    }
}
