//
//  JZNavigationController.swift
//  JZCommonExample
//
//  Created by S JZ on 2023/6/5.
//

import UIKit

open class JZNavigationController: UINavigationController {

    // 如果想在 JZViewController 中使用改变状态栏颜色属性，必须在导航栏中重写这两个属性
    open override var childForStatusBarStyle: UIViewController? { topViewController }
    open override var childForStatusBarHidden: UIViewController? { topViewController }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}


