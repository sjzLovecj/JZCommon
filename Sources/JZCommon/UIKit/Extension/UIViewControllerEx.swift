//
//  UIViewControllerEx.swift
//  Demo
//
//  Created by S JZ on 2022/11/1.
//

import UIKit
import SwiftUI

// MARK: - Controller中对view属性进行简单的封装
public extension UIViewController {
    // 控制器中，view的宽度
    var width: CGFloat { view.width }
    
    // 控制器中，view的高度
    var height: CGFloat { view.height }
    
    // 控制器中，获取、设置view的背景颜色
    var backgroundColor: UIColor? {
        get { view.backgroundColor }
        set { view.backgroundColor = newValue }
    }
    
    // 控制器中，view添加子视图
    func addSubView(_ view: UIView) {
        view.addSubview(view)
    }
}

// MARK: - 在Controller中添加 SwiftUI 的View
public extension UIViewController {
    
    /// 将 SwiftUI 的 View 生成Controller
    /// - Parameter content: SwiftUI 的 View
    /// - Returns: 生成的控制器
    func hostingController<Content: View>(content: () -> Content) -> UIViewController {
        let controller = HostingController(rootView:
            content().ignoresSafeArea()
        )
        controller.view.backgroundColor = .clear
        addChildVC(controller)
        return controller
    }
    
    /// 将SwiftUI的View生成UIView
    /// - Parameter content: SwiftUI的View
    /// - Returns: 生成控制器的View
    func hostingView<Content: View>(content: () -> Content) -> UIView {
        let controller = HostingController(rootView:
            content().ignoresSafeArea()
        )
        controller.view.backgroundColor = .clear
        addChildVC(controller)
        return controller.view
    }
    
    /// 添加子控制器
    /// - Parameter childVC: 子控制器
    func addChildVC(_ childVC: UIViewController) {
        addChild(childVC)
        childVC.didMove(toParent: self)
    }
    
    /// 删除子控制器
    /// - Parameter childVC: 子控制器
    func removeChildVC(_ childVC: UIViewController) {
        childVC.willMove(toParent: self)
        childVC.removeFromParent()
    }
}


