//
//  SJZNavigationController.swift
//  Demo
//
//  Created by S JZ on 2022/11/1.
//

import UIKit

open class SJZNavigationController: UINavigationController, UIGestureRecognizerDelegate {
    
    open override func viewDidLoad() {
        super.viewDidLoad()

        if UIDevice.current.userInterfaceIdiom == .phone {
            // 自定义返回按钮后，侧滑返回失效，写入下面两句可以解决该问题
            interactivePopGestureRecognizer?.delegate = self
            interactivePopGestureRecognizer?.isEnabled = true
        }
    }
    
    open override var childForStatusBarStyle: UIViewController? {
        return self.topViewController
    }
    
    // 隐藏
    open override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: animated)
    }
}

public extension SJZNavigationController {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer == interactivePopGestureRecognizer {
            if viewControllers.count < 2 {
                return false
            }
        }
        
        return true
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
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
