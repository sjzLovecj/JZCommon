//
//  JZViewController.swift
//  JZCommonExample
//
//  Created by S JZ on 2023/6/5.
//

import UIKit

/// 更改状态栏颜色：
/// 1. 在targets中的 info.plist 文件中将 View controller-based status bar appearance 设置为 NO
/// 2. 在自定义的 UINavigationController 中，重写 childForStatusBarStyle，并返回 topViewController
open class JZViewController: UIViewController {
    // 设置全局更改变量
    static private var configureKey = "configureKey"
    static private var configureDict = ControllerConfigurType<JZControllerConfigure>()
    static private var configureModel: JZControllerConfigure? {
        get { JZViewController.configureDict[configureKey] }
        set { JZViewController.configureDict[configureKey] = newValue }
    }
    public class func setConfigureModel(_ model: JZControllerConfigure) {
        configureModel = model
    }
    
    // MARK: - 更改状态栏颜色
    public var isStatusBarDark: Bool = true { didSet { setNeedsStatusBarAppearanceUpdate() } }
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        if isStatusBarDark { return .darkContent }
        return .lightContent
    }

    // MARK: - 是否隐藏导航栏
    public var isHiddenNavigaion: Bool = false
    
    // 设置导航栏样式
    // 如果在子控制器中，更改该属性后，请调用 reloadNavBar() 方法，刷新导航栏
    lazy public private(set) var navBarAppearance = UINavigationBarAppearance()
}

// 是否隐藏导航栏
extension JZViewController {
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        configureController()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configNavBarAppearance()
        // 隐藏导航栏
        if isHiddenNavigaion { navigationController?.setNavigationBarHidden(true, animated: animated) }
    }
    
    // 配置UINavigationBarAppearance，并重新给导航栏赋值
    public func configNavBarAppearance(appearance: ((UINavigationBarAppearance) -> ())? = nil) {
        appearance?(navBarAppearance)
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // 显示导航栏
        if isHiddenNavigaion, pushOrPopIsHidden() == false {
            navigationController?.setNavigationBarHidden(false, animated: animated)
        }
    }
    
    private func pushOrPopIsHidden() -> Bool {
        if let controllers = navigationController?.viewControllers, !controllers.isEmpty {
            if let vc = controllers[controllers.count - 1] as? JZViewController { return vc.isHiddenNavigaion }
        }
        return false
    }
    
    // 配置默认参数
    private func configureController() {
        guard let configureModel = JZViewController.configureModel else { return }
        backgroundColor = configureModel.backgroundColor
        isStatusBarDark = configureModel.isStatusBarDark
        
        if let appearance = configureModel.navBarAppearance {
            navBarAppearance = appearance
        }else {
            if let navBarBackGroundColor = configureModel.navBarBackGroundColor { navBarAppearance.backgroundColor = navBarBackGroundColor }
            if let navBarBackGroundImage = configureModel.navBarBackGroundImage { navBarAppearance.backgroundImage = navBarBackGroundImage }
            if let navBarBackgroundImageContentModel = configureModel.navBarBackgroundImageContentModel { navBarAppearance.backgroundImageContentMode = navBarBackgroundImageContentModel }
            if let navBarShadowColor = configureModel.navBarShadowColor { navBarAppearance.shadowColor = navBarShadowColor }
            if let navBarShadowImage = configureModel.navBarShadowImage { navBarAppearance.shadowImage = navBarShadowImage }
            if let navBarTitleTextAttributes = configureModel.navBarTitleTextAttributes { navBarAppearance.titleTextAttributes = navBarTitleTextAttributes }
            if let navBarLargeTitleTextAttributes = configureModel.navBarLargeTitleTextAttributes { navBarAppearance.largeTitleTextAttributes = navBarLargeTitleTextAttributes }
            if let navBarBackgroundEffect = configureModel.navBarBackgroundEffect { navBarAppearance.backgroundEffect = navBarBackgroundEffect }
            if let configNavBarBackGround = configureModel.configNavBarBackGround {
                if configNavBarBackGround == .default {
                    navBarAppearance.configureWithDefaultBackground()
                }else if configNavBarBackGround == .opaque {
                    navBarAppearance.configureWithOpaqueBackground()
                }else if configNavBarBackGround == .transparent {
                    navBarAppearance.configureWithTransparentBackground()
                }
            }
        }
    }
}
