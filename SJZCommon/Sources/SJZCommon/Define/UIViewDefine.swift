//
//  ViewDefine.swift
//  Demo
//
//  Created by S JZ on 2022/11/1.
//

import UIKit


public extension UIView {
    // View的高度
    var viewWidth: CGFloat {
        frame.size.width
    }
    
    // View的宽度
    var viewHeight: CGFloat {
        frame.size.height
    }
    
    // view的位置x
    var viewX: CGFloat {
        frame.origin.x
    }
    
    // view的位置y
    var viewY: CGFloat {
        frame.origin.y
    }
    
}
