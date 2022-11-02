//
//  UIFontDefine.swift
//  Demo
//
//  Created by S JZ on 2022/11/1.
//

import Foundation
import UIKit

public extension UIFont {
    @discardableResult
    @objc class func font(_ size: CGFloat) -> UIFont {
        systemFont(ofSize: size)
    }
    
    @discardableResult
    @objc class func medium(_ size: CGFloat) -> UIFont {
        systemFont(ofSize: size, weight: .medium)
    }
    
    @discardableResult
    @objc class func semibold(_ size: CGFloat) -> UIFont {
        systemFont(ofSize: size, weight: .semibold)
    }
    
    @discardableResult
    @objc class func bold(_ size: CGFloat) -> UIFont {
        systemFont(ofSize: size, weight: .bold)
    }
    
    @discardableResult
    @objc class func heavy(_ size: CGFloat) -> UIFont {
        systemFont(ofSize: size, weight: .heavy)
    }
    
    @discardableResult
    @objc class func black(_ size: CGFloat) -> UIFont {
        systemFont(ofSize: size, weight: .black)
    }
    
    @discardableResult
    @objc class func light(_ size: CGFloat) -> UIFont {
        systemFont(ofSize: size, weight: .light)
    }
    
    @discardableResult
    @objc class func thin(_ size: CGFloat) -> UIFont {
        systemFont(ofSize: size, weight: .thin)
    }
}

