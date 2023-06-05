//
//  UIViewEx.swift
//  Demo
//
//  Created by S JZ on 2022/11/1.
//

import UIKit

public extension UIView {
    // view的位置x
    var x: CGFloat {
        get { frame.origin.x }
        set {
            var viewFrame = frame
            viewFrame.origin.x = newValue
            frame = viewFrame
        }
    }
    
    // view的位置y
    var y: CGFloat {
        get { frame.origin.y }
        set {
            var viewFrame = frame
            viewFrame.origin.y = newValue
            frame = viewFrame
        }
    }
    
    // View的高度
    var width: CGFloat {
        get { frame.size.width }
        set {
            var viewFrame = frame
            viewFrame.size.width = newValue
            frame = viewFrame
        }
    }
    
    // View的宽度
    var height: CGFloat {
        get { frame.size.height }
        set {
            var viewFrame = frame
            viewFrame.size.height = newValue
            frame = viewFrame
        }
    }
    
    // 设置View的圆角
    var cornerRadius: CGFloat {
        get { layer.cornerRadius }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = true
        }
    }

    // 截图View图片
    func shotImageFromView() -> UIImage? {
        ScreenShot.shotImageFromView(self)
    }
}
