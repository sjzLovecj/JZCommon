//
//  JZControllerConfigure.swift
//  JZCommonExample
//
//  Created by S JZ on 2023/6/5.
//

import UIKit

public typealias ControllerConfigurType<T> = [String : T]

public enum ConfigureNavBarBackGround: Int {
    case none
    case `default`
    case opaque
    case transparent
}

// 统一设置默认父类属性
public class JZControllerConfigure: NSObject {
    // Controller背景颜色，默认为白色
    public var backgroundColor: UIColor = UIColor.white
    // 状态栏颜色，默认为黑色
    public var isStatusBarDark: Bool = true
    
    // 用于设置统一导航，与下面设置导航栏属性互斥
    public var navBarAppearance: UINavigationBarAppearance?

    // 如果不想初始化 navBarAppearance，请用下方属性设置NavBar
    public var navBarBackGroundColor: UIColor?
    public var navBarBackGroundImage: UIImage?
    public var navBarBackgroundImageContentModel: UIView.ContentMode?
    public var navBarShadowColor: UIColor?
    public var navBarShadowImage: UIImage?
    public var navBarTitleTextAttributes: [NSAttributedString.Key : Any]?
    public var navBarLargeTitleTextAttributes: [NSAttributedString.Key : Any]?
    public var navBarBackgroundEffect: UIBlurEffect?
    public var configNavBarBackGround: ConfigureNavBarBackGround?
}
