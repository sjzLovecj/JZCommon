//
//  BarConfigure.swift
//  JZCommonExample
//
//  Created by S JZ on 2023/6/6.
//

import UIKit

public struct BarConfigure {
    public static let shared: BarConfigure = BarConfigure()
    private init() { }
    
    public func confiNavAppearance(standard: (UINavigationBarAppearance) -> (), scrollEdge: (UINavigationBarAppearance) -> ()) {
        // 初始化设置
        var navStandardAppearance = UINavigationBarAppearance()
        var navScrollEdgeAppearance = UINavigationBarAppearance()
        
        standard(navStandardAppearance)
        scrollEdge(navScrollEdgeAppearance)
        
        UINavigationBar.appearance().standardAppearance = navStandardAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navScrollEdgeAppearance
    }
    
    public func confiTabBarAppearance(standard: (UITabBarAppearance) -> (), scrollEdge: (UITabBarAppearance) -> ()) {
        var tabStandardAppearance = UITabBarAppearance()
        var tabScrollEdgeAppearance = UITabBarAppearance()
        
        
        standard(tabStandardAppearance)
        scrollEdge(tabScrollEdgeAppearance)
        
        UITabBar.appearance().standardAppearance = tabStandardAppearance
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = tabScrollEdgeAppearance
        }
    }
}
