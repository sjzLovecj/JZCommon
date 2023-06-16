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



