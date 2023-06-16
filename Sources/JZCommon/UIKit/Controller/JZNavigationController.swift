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
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            // 自定义返回按钮后，侧滑返回失效，写入下面两句可以解决该问题
            interactivePopGestureRecognizer?.delegate = self
            interactivePopGestureRecognizer?.isEnabled = true
        }
    }
    
    open override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
}

extension JZNavigationController: UIGestureRecognizerDelegate {
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer == interactivePopGestureRecognizer {
            if viewControllers.count < 2 {
                return false
            }
        }
        
        return true
    }
    
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if let popGesture = interactivePopGestureRecognizer {
            if gestureRecognizer == popGesture {
                if let otherView = otherGestureRecognizer.view as? UIScrollView  {
                    if otherView.contentOffset.x > 0 {
                        return false
                    }
                }
                return true
            }

            if otherGestureRecognizer == popGesture {
                if let otherView = gestureRecognizer.view as? UIScrollView  {
                    if otherView.contentOffset.x > 0 {
                        return false
                    }
                }
                return true
            }
        }
    
        return false
    }
    
}



