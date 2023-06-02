//
//  ScreenShot.swift
//  JZCommonExample
//
//  Created by S JZ on 2023/6/2.
//

import UIKit

public struct ScreenShot {
    
    /// 截取view图片
    /// - Parameter view: 截取的view
    /// - Returns: 返回UIImage
    public static func shotImageFromView(_ view: UIView) -> UIImage? {
        var size = view.frame.size
        var image: UIImage?
        
        //参数1:表示区域大小 参数2:如果需要显示半透明效果,需要传NO,否则传YES 参数3:屏幕密度
        UIGraphicsBeginImageContextWithOptions(size, false, Define.scare)
        if let context = UIGraphicsGetCurrentContext() {
            view.layer.render(in: context)
            image = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        return image
    }
    
}
